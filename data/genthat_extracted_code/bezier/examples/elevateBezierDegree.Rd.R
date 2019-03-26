library(bezier)


### Name: elevateBezierDegree
### Title: Raises the degree of a Bezier curve
### Aliases: elevateBezierDegree

### ** Examples


## 4 DEGREE BEZIER CONTROL POINTS
p4 <- matrix(c(0,0, 1,4, 2,2, 3,0, 5,5), nrow=5, ncol=2, byrow=TRUE)

## GENERATE BEZIER CURVE FOR 4TH DEGREE BEZIER
b4 <- bezier(t=seq(0, 1, length=100), p=p4)

## ELEVATE BEZIER DEGREE
p5 <- apply(p4, 2, elevateBezierDegree, deg=5)

## GENERATE BEZIER CURVE FOR 5TH DEGREE BEZIER
b5 <- bezier(t=seq(0, 1, length=100), p=p5)

## ELEVATE BEZIER DEGREE
p6 <- apply(p4, 2, elevateBezierDegree, deg=6)

## GENERATE BEZIER CURVE FOR 6TH DEGREE BEZIER
b6 <- bezier(t=seq(0, 1, length=100), p=p6)

## PLOT ORIGINAL 4TH DEGREE BEZIER POINTS
plot(b4)

## PLOT 5TH DEGREE BEZIER POINTS WITHIN 4TH DEGREE POINTS
points(b5, col="red", cex=0.75)

## PLOT 6TH DEGREE BEZIER POINTS WITHIN 4TH DEGREE POINTS
## NOTE THAT POINTS COINCIDE EXACTLY WITH LOWER DEGREES
## THE CURVE IS UNCHANGED BY DEGREE ELEVATION
points(b6, col="green", cex=0.5)



