library(psycho)


### Name: analyze.htest
### Title: Analyze htest (correlation, t-test...) objects.
### Aliases: analyze.htest

### ** Examples

library(psycho)

df <- psycho::affective

x <- t.test(df$Tolerating, df$Adjusting)
x <- t.test(df$Tolerating ~ df$Sex)
x <- t.test(df$Tolerating, mu = 2)
x <- cor.test(df$Tolerating, df$Adjusting)

results <- analyze(x)
summary(results)
print(results)



