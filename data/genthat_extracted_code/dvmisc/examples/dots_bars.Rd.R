library(dvmisc)


### Name: dots_bars
### Title: Plot Points +/- Error Bars
### Aliases: dots_bars

### ** Examples

# Generate 100 values from normal distributions with different means, and 
# graph mean +/- standard deviation across groups 
dat <- cbind(rnorm(100, 2), rnorm(100, 2.5), rnorm(100, 1.75))
means <- apply(dat, 2, mean)
sds <- apply(dat, 2, sd)
fig1 <- dots_bars(y = means, bars = sds, main = "Mean +/- SD by Group",
                  ylab = "Mean +/- SD")
                  
# Simulate BMI values for males and females in 3 different age groups, and 
# graph mean +/- 95% CI
sex <- as.factor(c(rep("Male", 300), rep("Female", 300)))
age <- as.factor(rep(c("Young", "Middle", "Old"), 2))
bmi <- c(rnorm(100, 25, 4), rnorm(100, 26, 4.25), rnorm(100, 27, 4.5),
         rnorm(100, 26.5, 4.5), rnorm(100, 27.25, 4.75), rnorm(100, 28, 5))
dat <- data.frame(sex = sex, age = age, bmi = bmi)
means <- tapply(dat$bmi, dat[, c("sex", "age")], mean)
ci.lower <- tapply(dat$bmi, dat[, c("sex", "age")],
                   function(x) t.test(x)$conf.int[1])
ci.upper <- tapply(dat$bmi, dat[, c("sex", "age")],
                   function(x) t.test(x)$conf.int[2])
fig2 <- dots_bars(y = means, bars.lower = ci.lower, bars.upper = ci.upper,
                  main = "BMI by Sex and Age",
                  ylab = "BMI (mean +/- CI)",
                  xlab = "Age group")




