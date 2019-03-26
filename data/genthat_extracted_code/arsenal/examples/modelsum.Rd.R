library(arsenal)


### Name: modelsum
### Title: Fit models over each of a set of independent variables with a
###   response variable
### Aliases: modelsum

### ** Examples


data(mockstudy)

tab1 <- modelsum(bmi ~ sex + age, data = mockstudy)
summary(tab1, text = TRUE)

tab2 <- modelsum(alk.phos ~ arm + ps + hgb, adjust = ~ age + sex,
                 family = "gaussian", data = mockstudy)
summary(tab2, text = TRUE)

summary(tab2, show.intercept = FALSE, text = TRUE)

tab2.df <- as.data.frame(tab2)

tab2.df[1:5,]



