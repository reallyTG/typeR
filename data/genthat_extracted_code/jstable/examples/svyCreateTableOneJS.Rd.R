library(jstable)


### Name: svyCreateTableOneJS
### Title: svyCreateTableOneJS: Modified CreateTableOne function in
###   tableone package
### Aliases: svyCreateTableOneJS

### ** Examples

 library(survey);data(nhanes)
 nhanes$SDMVPSU <- as.factor(nhanes$SDMVPSU)
 nhanesSvy <- svydesign(ids = ~ SDMVPSU, strata = ~ SDMVSTRA, weights = ~ WTMEC2YR, 
                        nest = TRUE, data = nhanes)
 svyCreateTableOneJS(vars = c("HI_CHOL","race","agecat","RIAGENDR"), 
                     strata = "RIAGENDR", data = nhanesSvy)



