library(sqlscore)


### Name: create_statement
### Title: Generate a CREATE TABLE statement from a model
### Aliases: create_statement

### ** Examples

# Basic create statements
mod <- glm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species,
           data=datasets::iris)
create_statement(mod, src_table="tbl_name", dest_table="target_tbl")
create_statement(mod, src_table="tbl_name", src_schema="schema_name",
                 src_catalog="catalog_name", dest_table="target_tbl")
create_statement(mod, src_table="tbl_name", src_schema="schema_name",
                 src_catalog="catalog_name", dest_table="target_tbl",
                 dest_schema="target_schema", dest_catalog="target_catalog",
                 pk=c("lab", "specimen_id"))

#With a custom response function
create_statement(mod, src_table="tbl_name", src_schema="schema_name",
                 dest_table="target_tbl", response="probit")

# With a model-derived non-identity response function
mod <- glm(Sepal.Length > 5.0 ~ Sepal.Width + Petal.Length + Petal.Width + Species,
           data=datasets::iris, family=binomial("logit"))
create_statement(mod, src_table="tbl_name", dest_table="target_tbl")

#With formula operators
x <- matrix(rnorm(100*20),100,20)
colnames(x) <- sapply(1:20, function(x) paste0("X", as.character(x)))
x <- as.data.frame(x)
mod <- glm(X2 ~ X3 + X5 + X15*X8, data=x)
create_statement(mod, src_table="tbl_name", dest_table="target_tbl")
create_statement(mod, src_table="tbl_name", dest_table="target_tbl",
                 response="cauchit")




