library(support.CEs)


### Name: sb.design
### Title: Creating or checking a choice experiment design using the Street
###   and Burgess Method
### Aliases: sb.design print.sb summary.sb print.summary.sb
### Keywords: design

### ** Examples

# The following lines of code reproduce five examples shown on 
# the website Discrete Choice Experiments.

# Check Main Ex. 1
## Not run: 
##D CheckMainEx1.sets <- matrix(c(
##D   0, 0, 0, 0, 3, 2, 2, 2,
##D   2, 2, 0, 2, 1, 1, 2, 1,
##D   3, 0, 0, 0, 2, 2, 2, 2,
##D   1, 1, 0, 1, 0, 0, 2, 0,
##D   1, 0, 2, 0, 0, 2, 1, 2,
##D   3, 2, 1, 0, 2, 1, 0, 2,
##D   2, 1, 0, 0, 1, 0, 2, 2,
##D   0, 0, 0, 2, 3, 2, 2, 1,
##D   3, 0, 0, 1, 2, 2, 2, 0,
##D   0, 2, 2, 1, 3, 1, 1, 0,
##D   1, 2, 0, 0, 0, 1, 2, 2,
##D   1, 0, 1, 2, 0, 2, 0, 1,
##D   2, 0, 2, 0, 1, 2, 1, 2,
##D   2, 0, 1, 1, 1, 2, 0, 0,
##D   3, 1, 2, 2, 2, 0, 1, 1,
##D   0, 1, 1, 0, 3, 0, 0, 2),
##D   nrow = 16, byrow = TRUE)
##D 
##D CheckMainEx1 <- sb.design(
##D   operation       = "check", 
##D   nattributes     = 4,
##D   nlevels         = c(4, 3, 3, 3),
##D   nalternatives   = 2,
##D   attribute.names = list(A = c("a0", "a1", "a2", "a3"),
##D                          B = c("b0", "b1", "b2"),
##D                          C = c("c0", "c1", "c2"),
##D                          D = c("d0", "d1", "d2")),
##D   design          = CheckMainEx1.sets,
##D   effect          = "main")
##D 
##D CheckMainEx1
##D summary(CheckMainEx1)
## End(Not run)

# Construct Main Ex. 1
## Not run: 
##D ConstructMainEx1.treatment <- matrix(c(
##D   0, 0, 0, 0,
##D   2, 2, 0, 2,
##D   3, 0, 0, 0,
##D   1, 1, 0, 1,
##D   1, 0, 2, 0,
##D   3, 2, 1, 0,
##D   2, 1, 0, 0,
##D   0, 0, 0, 2,
##D   3, 0, 0, 1,
##D   0, 2, 2, 1,
##D   1, 2, 0, 0,
##D   1, 0, 1, 2,
##D   2, 0, 2, 0,
##D   2, 0, 1, 1,
##D   3, 1, 2, 2,
##D   0, 1, 1, 0),
##D   nrow = 16, byrow = TRUE)
##D 
##D ConstructMainEx1 <- sb.design(
##D   operation       = "construct", 
##D   nattributes     = 4,
##D   nlevels         = c(4, 3, 3, 3),
##D   nalternatives   = 2,
##D   attribute.names = list(A = c("a0", "a1", "a2", "a3"), 
##D                          B = c("b0", "b1", "b2"),
##D                          C = c("c0", "c1", "c2"),
##D                          D = c("d0", "d1", "d2")),
##D   design          = ConstructMainEx1.treatment,
##D   generators      = c(3, 2, 2, 2),
##D   effect          = "main")
##D 
##D ConstructMainEx1
##D summary(ConstructMainEx1)
## End(Not run)

# Construct Main Ex. 2
## Not run: 
##D ConstructMainEx2.treatment <- matrix(c(
##D   0, 0,
##D   0, 1,
##D   1, 0,
##D   1, 1), 
##D   nrow = 4, byrow = TRUE)
##D 
##D ConstructMainEx2 <- sb.design(
##D   operation       = "construct", 
##D   nattributes     = 2,
##D   nlevels         = c(2, 2),
##D   nalternatives   = 2,
##D   attribute.names = list(X = c("x0", "x1"), 
##D                          Y = c("y0", "y1")),
##D   design          = ConstructMainEx2.treatment,
##D   generators      = c(1, 1),
##D   effect          = "main")
##D 
##D ConstructMainEx2
##D summary(ConstructMainEx2)
## End(Not run)

# Construct Main + Some Ex. 1
## Not run: 
##D ConstructMainSomeEx1.treatment <- matrix(c(
##D   0, 0, 0, 0,
##D   2, 2, 0, 2,
##D   3, 0, 0, 0,
##D   1, 1, 0, 1,
##D   1, 0, 2, 0,
##D   3, 2, 1, 0,
##D   2, 1, 0, 0,
##D   0, 0, 0, 2,
##D   3, 0, 0, 1,
##D   0, 2, 2, 1,
##D   1, 2, 0, 0,
##D   1, 0, 1, 2,
##D   2, 0, 2, 0,
##D   2, 0, 1, 1,
##D   3, 1, 2, 2,
##D   0, 1, 1, 0),
##D   nrow = 16, byrow = TRUE)
##D 
##D ConstructMainSomeEx1 <- sb.design(
##D   operation       = "construct", 
##D   nattributes     = 4,
##D   nlevels         = c(4, 3, 3, 3),
##D   nalternatives   = 2,
##D   attribute.names = list(A = c("a0", "a1", "a2", "a3"), 
##D                          B = c("b0", "b1", "b2"),
##D                          C = c("c0", "c1", "c2"),
##D                          D = c("d0", "d1", "d2")),
##D   design          = ConstructMainSomeEx1.treatment,
##D   generators      = c(3, 2, 2, 2),
##D   effect          = "mplussome",
##D   interactions    = c(1, 2),
##D   determinant     = "1")
##D 
##D ConstructMainSomeEx1
##D summary(ConstructMainSomeEx1)
## End(Not run)

# Construct Main + Some Ex. 2
## Not run: 
##D ConstructMainSomeEx2.treatment <- matrix(c(
##D   0, 0,
##D   0, 1,
##D   1, 0,
##D   1, 1), 
##D   nrow = 4, byrow = TRUE)
##D 
##D ConstructMainSomeEx2 <- sb.design(
##D   operation       = "construct", 
##D   nattributes     = 2,
##D   nlevels         = c(2, 2),
##D   nalternatives   = 2,
##D   attribute.names = list(X = c("x0", "x1"), 
##D                          Y = c("y0", "y1")),
##D   design          = ConstructMainSomeEx2.treatment,
##D   generators      = matrix(c(0, 1, 1, 1), nrow = 2, byrow = TRUE),
##D   effect          = "mplussome",
##D   interactions    = c(1, 2),
##D   determinant     = NULL)
##D 
##D ConstructMainSomeEx2
##D summary(ConstructMainSomeEx2)
## End(Not run)



