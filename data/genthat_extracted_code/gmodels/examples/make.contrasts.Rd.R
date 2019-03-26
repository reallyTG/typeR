library(gmodels)


### Name: make.contrasts
### Title: Construct a User-Specified Contrast Matrix
### Aliases: make.contrasts
### Keywords: models regression

### ** Examples

set.seed(4684)
y <- rnorm(100)
x.true <- rnorm(100, mean=y, sd=0.25)
x <-  factor(cut(x.true,c(-4,-1.5,0,1.5,4)))
reg <- lm(y ~ x)
summary(reg)

# Mirror default treatment contrasts
test <- make.contrasts(rbind( c(-1,1,0,0), c(-1,0,1,0), c(-1,0,0,1) ))
lm( y ~ x, contrasts=list(x = test ))

# Specify some more complicated contrasts
#   - mean of 1st group vs mean of 4th group
#   - mean of 1st and 2nd groups vs mean of 3rd and 4th groups
#   - mean of 1st group vs mean of 2nd, 3rd and 4th groups
cmat <- rbind( "1 vs 4"    =c(-1, 0, 0, 1),
               "1+2 vs 3+4"=c(-1/2,-1/2, 1/2, 1/2),
               "1 vs 2+3+4"=c(-3/3, 1/3, 1/3, 1/3))

summary(lm( y ~ x, contrasts=list(x=make.contrasts(cmat) )))
# or
contrasts(x) <- make.contrasts(cmat)
summary(lm( y ~ x ) )

# or use contrasts.lm
reg <- lm(y ~ x)
fit.contrast( reg, "x", cmat )

# compare with values computed directly using group means
gm <- sapply(split(y,x),mean)
gm 


#
# Example for Analysis of Variance
#

set.seed(03215)
Genotype <- sample(c("WT","KO"), 1000, replace=TRUE)
Time <- factor(sample(1:3, 1000, replace=TRUE))
data <- data.frame(y, Genotype, Time)
y <- rnorm(1000)

data <- data.frame(y, Genotype, as.factor(Time))

# Compute Contrasts & obtain 95% confidence intervals

model <- aov( y ~ Genotype + Time + Genotype:Time, data=data )

fit.contrast( model, "Genotype", rbind("KO vs WT"=c(-1,1) ), conf=0.95 )

fit.contrast( model, "Time",
            rbind("1 vs 2"=c(-1,1,0),
                  "2 vs 3"=c(0,-1,1)
                  ),
            conf=0.95 )


cm.G <- rbind("KO vs WT"=c(-1,1) )
cm.T <- rbind("1 vs 2"=c(-1,1,0),
              "2 vs 3"=c(0,-1,1) )

# Compute contrasts and show SSQ decompositions

model <- model <- aov( y ~ Genotype + Time + Genotype:Time, data=data,
                      contrasts=list(Genotype=make.contrasts(cm.G),
                                     Time=make.contrasts(cm.T) )
                      )

summary(model, split=list( Genotype=list( "KO vs WT"=1 ),
                           Time = list( "1 vs 2" = 1,
                                        "2 vs 3" = 2 ) ) )





