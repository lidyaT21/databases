DROP DATABASE IF EXISTS recipes;

CREATE DATABASE recipes;

USE recipes;

CREATE TABLE Recipes (
    recipe_id INT PRIMARY KEY AUTO_INCREMENT, recipe_name VARCHAR(255) NOT NULL, cooking_time INT, 
    preparation_time INT
);

CREATE TABLE Ingredients (
    ingredient_id INT PRIMARY KEY AUTO_INCREMENT, ingredient_name VARCHAR(255) NOT NULL
);

CREATE TABLE Directions (
    direction_id INT PRIMARY KEY AUTO_INCREMENT, instruction TEXT NOT NULL
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT, category_name VARCHAR(255) NOT NULL
);

CREATE TABLE RecipeDirections (
    recipe_id INT, direction_id INT, step_number INT, PRIMARY KEY (recipe_id, direction_id), FOREIGN KEY (recipe_id) REFERENCES Recipes (recipe_id), FOREIGN KEY (direction_id) REFERENCES Directions (direction_id)
);

CREATE TABLE RecipeCategories (
    recipe_id INT, category_id INT, PRIMARY KEY (recipe_id, category_id), FOREIGN KEY (recipe_id) REFERENCES Recipes (recipe_id), FOREIGN KEY (category_id) REFERENCES Categories (category_id)
);

CREATE TABLE RecipeIngredients (
    recipe_id INT, ingredient_id INT, quantity DECIMAL(10, 2),
    unit VARCHAR(255), 
    prep_type VARCHAR(255),
    PRIMARY KEY (recipe_id, ingredient_id), FOREIGN KEY (recipe_id) REFERENCES Recipes (recipe_id), FOREIGN KEY (ingredient_id) REFERENCES Ingredients (ingredient_id)
);