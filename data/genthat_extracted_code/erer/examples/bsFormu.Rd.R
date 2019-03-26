library(erer)


### Name: bsFormu
### Title: Generating Formula for Models
### Aliases: bsFormu
### Keywords: manip

### ** Examples


# fake data
y  <- c("y")
ym <- c("y1", "y2", "y3")
x <- c("x")
xAll <- c("x", "xx", "xxx", "xxxx")

bsFormu(name.y = y, name.x = x)
bsFormu(name.y = ym, name.x = xAll)
fm.ym <- bsFormu(name.y = ym, name.x = xAll, intercept = FALSE)
fm.ym

# If independent variables differ by equation,
# add a loop to address the differentiation.
xInd <- c("x1", "x2", "x3")
fm.ym <- list()
for (i in 1:length(ym)) {
    ny <- ym[i]
    nx <- c(xInd[i], xAll)
    fm.ym[[i]] <- bsFormu(name.y = ny, name.x = nx, intercept = FALSE)
}
fm.ym

# real data
data(daIns)
(xx <- colnames(daIns)[-c(1, 14)])
fm.ins <- bsFormu(name.y = "Y", name.x = xx, intercept = TRUE)
fm.ins
(ra <- glm(formula = fm.ins,
          family = binomial(link="logit"),
          data = daIns, x = TRUE))



