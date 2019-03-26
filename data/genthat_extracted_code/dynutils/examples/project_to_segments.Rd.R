library(dynutils)


### Name: project_to_segments
### Title: Project a set of points to to set of segments
### Aliases: project_to_segments

### ** Examples

x <- matrix(rnorm(50, 0, .5), ncol = 2)
segfrom <- matrix(c(0, 1, 0, -1, 1, 0, -1, 0), ncol = 2, byrow = TRUE)
segto <- segfrom / 10
fit <- project_to_segments(x, segfrom, segto)

str(fit) # examine output




