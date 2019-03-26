library(agridat)


### Name: gomez.fractionalfactorial
### Title: Rice fractional factorial experiment 1/2 2^6.
### Aliases: gomez.fractionalfactorial

### ** Examples


data(gomez.fractionalfactorial)
dat <- gomez.fractionalfactorial

# trt abcdef has the highest yield
# Gomez, Figure 4.8
if(require(desplot)){
  desplot(yield~col*row, dat,
          # aspect unknown
          text=trt, shorten="none", show.key=FALSE, cex=1,
          main="gomez.fractionalfactorial - treatment & yield")
}

# Split treatment into individual factors
dat <- transform(dat,
                 a = -1 + 2 * grepl('a',trt),
                  b = -1 + 2 * grepl('b',trt),
                 c = -1 + 2 * grepl('c',trt),
                 d = -1 + 2 * grepl('d',trt),
                 e = -1 + 2 * grepl('e',trt),
                 f = -1 + 2 * grepl('f',trt))

# Gomez table 4.24, trt SS totalled together.
# Why didn't Gomez nest block within rep?
m0 <- lm(yield ~ rep * block + trt, dat)
anova(m0)

# Gomez table 4.24, trt SS split apart
m1 <- lm(yield ~ rep * block + (a+b+c+d+e+f)^3, dat)
anova(m1)

## Not run: 
##D   require(FrF2)
##D   aliases(m1)
##D   MEPlot(m1, select=3:8,
##D          main="gomez.fractionalfactorial - main effects plot")
## End(Not run)




