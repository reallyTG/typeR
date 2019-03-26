library(agridat)


### Name: holtsmark.timothy.uniformity
### Title: Uniformity trial of timothy
### Aliases: holtsmark.timothy.uniformity
### Keywords: datasets

### ** Examples


data(holtsmark.timothy.uniformity)
dat <- holtsmark.timothy.uniformity

# Define diagonal 'check' plots like Holtsmark does
dat <- transform(dat,
                 check = ifelse(floor((row+col)/3)==(row+col)/3, "C", ""))
                 
if(require(desplot)){
  desplot(yield ~ col*row, data=dat, flip=TRUE, text=check, show.key=FALSE,
          aspect=30/200, # true aspect
          main="holtsmark.timothy.uniformity")
}

sd(dat$yield) # 2.92 matches Holtsmark p. 348




