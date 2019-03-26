library(AER)


### Name: STAR
### Title: Project STAR: Student-Teacher Achievement Ratio
### Aliases: STAR
### Keywords: datasets

### ** Examples

data("STAR")

## Stock and Watson, p. 488
fmk <- lm(I(readk + mathk) ~ stark, data = STAR)
fm1 <- lm(I(read1 + math1) ~ star1, data = STAR)
fm2 <- lm(I(read2 + math2) ~ star2, data = STAR)
fm3 <- lm(I(read3 + math3) ~ star3, data = STAR)

coeftest(fm3, vcov = sandwich)
plot(I(read3 + math3) ~ star3, data = STAR)

## Stock and Watson, p. 489
fmke <- lm(I(readk + mathk) ~ stark + experiencek, data = STAR)
coeftest(fmke, vcov = sandwich)

## reshape data from wide into long format
## 1. variables and their levels
nam <- c("star", "read", "math", "lunch", "school", "degree", "ladder",
  "experience", "tethnicity", "system", "schoolid")
lev <- c("k", "1", "2", "3")
## 2. reshaping
star <- reshape(STAR, idvar = "id", ids = row.names(STAR),
  times = lev, timevar = "grade", direction = "long",
  varying = lapply(nam, function(x) paste(x, lev, sep = "")))
## 3. improve variable names and type
names(star)[5:15] <- nam
star$id <- factor(star$id)
star$grade <- factor(star$grade, levels = lev, labels = c("kindergarten", "1st", "2nd", "3rd"))
rm(nam, lev)

## fit a single model nested in grade (equivalent to fmk, fm1, fm2, fmk)
fm <- lm(I(read + math) ~ 0 + grade/star, data = star)
coeftest(fm, vcov = sandwich)

## visualization
library("lattice")
bwplot(I(read + math) ~ star | grade, data = star)



