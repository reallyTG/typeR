library(limSolve)


### Name: Minkdiet
### Title: An underdetermined linear inverse problem: estimating diet
###   composition of Southeast Alaskan Mink.
### Aliases: Minkdiet
### Keywords: datasets

### ** Examples

# 1. visualisation of the data
plot(t(Minkdiet$Prey), xlim = c(-25, -13), xlab = "d13C", ylab = "d15N",
     main = "Minkdiet", sub = "Ben-David et al. (1979)")

text(t(Minkdiet$Prey)-0.1, colnames(Minkdiet$Prey))   

points(t(Minkdiet$Mink), pch = 16, cex = 2)
text(t(Minkdiet$Mink)-0.15, "MINK", cex = 1.2)   
legend("bottomright", pt.cex = c(1, 2), pch = c(1, 16),
       c("food", "predator"))

# 2. Generate the food web model input matrices
# the equalities: 
E <- rbind(Minkdiet$Prey, rep(1, 7))
F <- c(Minkdiet$Mink, 1)

# the inequalities (all pi>0)
G <- diag(7)
H <- rep(0, 7)

# 3. Select the parsimonious (simplest) solution
parsimonious <- ldei(E, F, G = G, H = H)

# 4. show results
data.frame(food = colnames(Minkdiet$Prey),
           fraction = parsimonious$X)

dotchart(x = as.vector(parsimonious$X), labels = colnames(Minkdiet$A),
         main = "Estimated diet composition of Mink",
         sub = "using ldei and xranges", pch = 16)

# 5. Ranges of diet composition
iso   <- xranges(E, F, ispos = TRUE)
segments(iso[,1], 1:ncol(E), iso[,2], 1:ncol(E))
legend  ("topright", pch = c(16, NA), lty = c(NA, 1),
          legend = c("parsimonious", "range"))

pairs (xsample(E = E, F = F, G = diag(7), H = rep(0, 7), iter = 1000)$X,
       main = "Minkdiet 1000 solutions, using xsample")



