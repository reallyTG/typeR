library(jstable)


### Name: svyCreateTableOne2
### Title: svyCreateTableOne2: Modified svyCreateTableOne function in
###   tableone package
### Aliases: svyCreateTableOne2

### ** Examples

 library(survey);data(nhanes)
 nhanes$SDMVPSU <- as.factor(nhanes$SDMVPSU)
 nhanesSvy <- svydesign(ids = ~ SDMVPSU, strata = ~ SDMVSTRA, weights = ~ WTMEC2YR, 
                        nest = TRUE, data = nhanes)
 svyCreateTableOne2(vars = c("HI_CHOL","race","agecat","RIAGENDR"), 
                    strata = "RIAGENDR", data = nhanesSvy)



