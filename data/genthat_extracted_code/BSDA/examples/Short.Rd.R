library(BSDA)


### Name: Short
### Title: James Short's measurements of the parallax of the sun
### Aliases: Short
### Keywords: datasets

### ** Examples


hist(Short$parallax, main = "Problem 6.65", 
xlab = "", col = "orange")
SIGN.test(Short$parallax, md = 8.798)
t.test(Short$parallax, mu = 8.798)




