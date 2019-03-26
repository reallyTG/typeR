library(broom)


### Name: tidy.biglm
### Title: Tidy a(n) biglm object
### Aliases: tidy.biglm

### ** Examples


if (require("biglm", quietly = TRUE)) {
    bfit <- biglm(mpg ~ wt + disp, mtcars)
    tidy(bfit)
    tidy(bfit, conf.int = TRUE)
    tidy(bfit, conf.int = TRUE, conf.level = .9)

    glance(bfit)

    # bigglm: logistic regression
    bgfit <- bigglm(am ~ mpg, mtcars, family = binomial())
    tidy(bgfit)
    tidy(bgfit, exponentiate = TRUE)
    tidy(bgfit, conf.int = TRUE)
    tidy(bgfit, conf.int = TRUE, conf.level = .9)
    tidy(bgfit, conf.int = TRUE, conf.level = .9, exponentiate = TRUE)

    glance(bgfit)
}




