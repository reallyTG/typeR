library(BlandAltmanLeh)


### Name: bland.altman.stats
### Title: Calculate statistics for Bland-Altman-Plot
### Aliases: bland.altman.stats

### ** Examples

# simple calculation of stats:
a <- rnorm(20)
b <- jitter(a)
print(bland.altman.stats(a, b))
print(bland.altman.stats(a, b)$critical.diff)

# drawing Bland-Altman-Plot with color coding sex:
example.data <- data.frame(sex = gl(2,6,labels=c("f","m")),
                 m1 = c(16,10,14,18,16,15,18,19,14,11,11,17),
                 m2 = c(18, 9,15,19,19,13,19,20,14,11,13,17))
ba <- bland.altman.stats(example.data$m1, example.data$m2)
plot(ba$means, ba$diffs, col=example.data$sex, ylim=c(-4,4))
abline(h=ba$lines, lty=2)
              
# compute 95%-CIs for the bias and upper and lower limits of PEFR data as 
# in Bland&Altman 1986
bland.altman.stats(bland.altman.PEFR[,1],bland.altman.PEFR[,3])$CI.lines
# apparently wrong results? CAVE: Bland&Altman are using two=2, thus
bland.altman.stats(bland.altman.PEFR[,1],bland.altman.PEFR[,3], two=2)$CI.lines



