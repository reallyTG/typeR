library(agridat)


### Name: bose.multi.uniformity
### Title: Uniformity trials of barley, wheat, lentils
### Aliases: bose.multi.uniformity
### Keywords: datasets

### ** Examples


data(bose.multi.uniformity)
dat <- bose.multi.uniformity

# match sum at bottom of Bose tables 1, 4, 5
# dat %>% group_by(year) %>% summarize(sum=sum(yield))

if(require(desplot) & require(dplyr)){
  # Calculate percent of mean yield for each year
  dat <- group_by_(dat, ~ year)
  dat <- mutate_(dat, pctyld = ~ (yield-mean(yield))/mean(yield))
  dat$year = factor(dat$year)
  # Bose smoothed the data by averaging 2x3 plots together before drawing
  # contour maps.  Heatmaps of raw data have similar structure to Bose Fig 1.
  desplot(pctyld ~ col*row|year, dat,
          tick=TRUE, flip=TRUE, aspect=(26)/(15),
          main="bose.multi.* - Percent of mean yield")
  
  # contourplot() results need to be mentally flipped upside down
  # contourplot(pctyld ~ col*row|year, dat,
  #   region=TRUE, as.table=TRUE, aspect=26/15)
}




