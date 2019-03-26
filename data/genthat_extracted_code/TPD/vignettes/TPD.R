## ----echo=FALSE, warning=FALSE, message = FALSE--------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(TPD)
library(ks)
library(ggplot2)
library(gridExtra)

## ---- echo=TRUE----------------------------------------------------------
kde_height <- density(trees$Height)
plot(kde_height, main = "TPD height")

## ---- echo=TRUE----------------------------------------------------------
grid <- seq(from = 50, to = 100, length.out = 50)
edge_length <- grid[2] - grid[1] 
#Each interval has this size (in trait units):
edge_length

## ---- echo=TRUE----------------------------------------------------------
kde_height <- density(trees$Height, from = 50, to = 100, n = 50)
plot(kde_height, main = "TPD height")
points(kde_height$x, kde_height$y, pch = 16, col = 2 , cex=0.6)
abline(v = grid, col = "grey50", lwd = 0.3)

## ---- echo=TRUE----------------------------------------------------------
sum(edge_length * kde_height$y)

## ---- echo=TRUE----------------------------------------------------------
head(iris)

## ---- echo=TRUE----------------------------------------------------------
traits_iris <- iris[, c("Sepal.Length", "Sepal.Width")]
sp_iris <- iris$Species
TPDs_iris <- TPDs(species = sp_iris, traits_iris)

## ----echo=T--------------------------------------------------------------
head(TPDs_iris$data$evaluation_grid)
nrow(TPDs_iris$data$evaluation_grid) 
names(TPDs_iris$TPDs)
head(sort(TPDs_iris$TPDs$setosa, decreasing = TRUE))
sum(TPDs_iris$TPDs$setosa)

## ----echo=T--------------------------------------------------------------
summary(TPDs_iris$TPDs)
# The sum of all the elements in each TPDs is equal to 1:
sapply(TPDs_iris$TPDs, sum)

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
plotTPD(TPD = TPDs_iris, nRowCol = c(1,3)) 

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
traits_iris_d1 <- iris[, c("Sepal.Length")]
sp_iris <- iris$Species
TPDs_iris_d1_a1 <- TPDs(species = sp_iris, traits = traits_iris_d1, alpha=1)
plotTPD(TPD = TPDs_iris_d1_a1, nRowCol = c(1,3)) 

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
TPDs_iris_d1_a095 <- TPDs(species = sp_iris, traits = traits_iris_d1, alpha=0.95)
plotTPD(TPD = TPDs_iris_d1_a095, nRowCol = c(1,3)) 

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
TPDs_iris_d1_a05 <- TPDs(species = sp_iris, traits = traits_iris_d1, alpha=0.5)
plotTPD(TPD = TPDs_iris_d1_a05, nRowCol = c(1,3)) 

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
TPDs_iris_a95 <- TPDs(species = sp_iris, traits = traits_iris, alpha=0.95)
plotTPD(TPD = TPDs_iris_a95, nRowCol = c(1,3)) 

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
TPDs_iris_a75 <- TPDs(species = sp_iris, traits = traits_iris, alpha=0.75)
plotTPD(TPD = TPDs_iris_a75, nRowCol = c(1,3)) 

## ----echo=T, fig.width = 5, fig.height = 7-------------------------------
pops_iris <- rep(c(rep("Site.1", 25), rep("Site.2", 25)), 3)
TPDs_pops_iris <- TPDs (species = sp_iris, traits = traits_iris, samples = pops_iris)
plotTPD(TPD = TPDs_pops_iris, nRowCol = c(3,2)) 

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
names_iris <- unique(iris$Species)
mt1 <- tapply(iris[, "Sepal.Length"], iris$Species, mean)
mt2 <- tapply(iris[, "Sepal.Width"], iris$Species, mean)
means_iris <- matrix(c(mt1, mt2), ncol=2)
st1 <- tapply(iris[, "Sepal.Length"], iris$Species, sd)
st2 <- tapply(iris[, "Sepal.Width"], iris$Species, sd)
sds_iris <- matrix(c(st1, st2), ncol=2)
TPDsMean_iris<- TPDsMean(species = names_iris, means = means_iris, sds = sds_iris)
plotTPD(TPD = TPDsMean_iris, nRowCol = c(1,3))

## ----echo=T--------------------------------------------------------------

abundances_comm_iris <- matrix(c(c(0.5, 0.4, 0), #I. virginica absent
                          c(0.0, 0.9,  0.1 ), #I. versic. dominates; setosa absent
                          c(0.0, 0.1,  0.9 )), #I. virg. dominates; setosa absent
                          ncol = 3, byrow = TRUE, dimnames = list(paste0("Comm.",1:3),
                          unique(iris$Species))) 
                 

## ----echo=T--------------------------------------------------------------
TPDs_iris <- TPDs(species = sp_iris, traits_iris)
TPDc_iris <- TPDc(TPDs = TPDs_iris, sampUnit = abundances_comm_iris )

## ----echo=T--------------------------------------------------------------
sapply(TPDc_iris$TPDc$TPDc, sum)

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
plotTPD(TPD = TPDc_iris, nRowCol = c(1,3))

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
TPDs_iris_d1 <- TPDs(species = sp_iris, traits_iris_d1)
RED_d1 <- REND(TPDs = TPDs_iris_d1)

TPDs_iris_d2 <- TPDs(species = sp_iris, traits_iris)
RED_d2 <- REND(TPDs = TPDs_iris_d2)

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
plotTPD(TPD = TPDs_iris_d1, nRowCol = c(1, 3), leg.text = paste0(names(RED_d1$species$FRichnes),
  "; FRic=", round(RED_d1$species$FRichnes, 3)))
plotTPD(TPD = TPDs_iris_d2, nRowCol = c(1, 3), leg.text = paste0(names(RED_d2$species$FRichnes),
  "; FRic=", round(RED_d2$species$FRichnes, 3)))

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
abundances_comm_iris_divergence <- matrix(c(c(0.45, 0.1, 0.45), # Different species are more abundant
                          c(0.05, 0.9,  0.05 ),  # Different species are less abundant
                          c(0.9,  0.05, 0.05 )), # A species with extreme trait values is very abundant
                          ncol = 3, byrow = TRUE, dimnames = list(paste0("Comm.",1:3),
                          unique(iris$Species))) 

TPDc_iris_divergence_d1 <- TPDc(TPDs = TPDs_iris_d1, sampUnit = abundances_comm_iris_divergence)
RED_comm_d1 <- REND(TPDc = TPDc_iris_divergence_d1)
plotTPD(TPD = TPDc_iris_divergence_d1, nRowCol = c(1, 3), 
  leg.text = paste0(names(RED_comm_d1$communities$FDivergence),
  "; FDiv=", round(RED_comm_d1$communities$FDivergence, 3)))

TPDc_iris_divergence_d2 <- TPDc(TPDs = TPDs_iris_d2, sampUnit = abundances_comm_iris_divergence)
RED_comm_d2 <- REND(TPDc = TPDc_iris_divergence_d2)
plotTPD(TPD = TPDc_iris_divergence_d2, nRowCol = c(1, 3), 
  leg.text = paste0(names(RED_comm_d2$communities$FDivergence),
  "; FDiv=", round(RED_comm_d2$communities$FDivergence, 3)))

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
RED_comm_d1$communities$FRichness
RED_comm_d2$communities$FRichness

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
set.seed(1)
sp_means <- rep(seq(0, 8, length.out = 4), 2)
sp_sds <- rep(c(0.5, 1), each=4)
sp_trait <- numeric()
n_indiv <- 50
for (i in 1:length(sp_means)) {
  sp_trait <- c(sp_trait, rnorm(n_indiv, sp_means[i], sp_sds[i]))
}
sp_names <- rep(paste0("SP.", 1:length(sp_means)), each=n_indiv)
TPDs_sp <- TPDs(species = sp_names, traits = sp_trait, alpha = 0.99)
plotTPD(TPD = TPDs_sp, nRowCol = c(2,4))

## ----echo=T, fig.width = 7, fig.height = 4-------------------------------

comm_abundances <- matrix(c( c(0.25, 0.25, 0.25, 0.25, 0,    0,    0,    0), #Comm1, goup 1, equal abundances
                             c(0,    0,    0,    0,    0.25, 0.25, 0.25, 0.25), #Comm2, goup 2, equal abundances
                             c(0.85, 0.05, 0.05, 0.05, 0,    0,    0,    0), #Comm3, goup 1, unequal abundances
                             c(0,    0,    0,    0,    0.85, 0.05, 0.05, 0.05)), #Comm4, goup 2, unequal abundances
                             ncol = 8, byrow = TRUE, dimnames = list(paste0("Comm.",1:4),
                             unique(sp_names))) 

TPDc_sp <- TPDc(TPDs = TPDs_sp, sampUnit = comm_abundances)
RED_sp <- REND(TPDc_sp)
plotTPD(TPDc_sp, nRowCol = c(2,2), leg.text = paste0(names(RED_sp$communities$FEvenness),
  "; FEve=", round(RED_sp$communities$FEvenness, 3)))

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
Iris_samp <- tSamp(TPDs=TPDs_iris, size=1000)

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
plotTPD(TPDs_iris, nRowCol = c(1,3))
par(mfrow=c(1,3))
for (i in 1:3){
  plot(Iris_samp$species_samples[[i]], pch = 16, cex = 0.6, 
    xlim = range(TPDs_iris$data$evaluation_grid[[1]]),
    ylim = range(TPDs_iris$data$evaluation_grid[[2]]))
}

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
Iris_comm_samp <- tSamp(TPDc = TPDc_iris, size = 1000)
plotTPD(TPDc_iris, nRowCol = c(1,3))
par(mfrow=c(1,3))
for (i in 1:3){
  plot(Iris_comm_samp$communities_samples[[i]], pch = 16, cex = 0.6, 
    xlim = range(TPDc_iris$data$evaluation_grid[[1]]),
    ylim = range(TPDc_iris$data$evaluation_grid[[2]]))
}

## ----echo = T, fig.width = 6, fig.height = 4-----------------------------
par(mfrow=c(1,1))
plot(TPDs_iris_d1$data$evaluation_grid, TPDs_iris_d1$TPDs[[1]], type="n", 
  ylim = c(0,max(sapply(TPDs_iris_d1$TPDs, max))))

for (i in 1:length(TPDs_iris_d1$TPDs)){
  lines(TPDs_iris_d1$data$evaluation_grid, TPDs_iris_d1$TPDs[[i]], lwd=2, col=i)
}
legend("topright", bty = "n", lwd = 2, col = 1:length(TPDs_iris_d1$TPDs),
  legend = names(TPDs_iris_d1$TPDs))

## ----echo = T------------------------------------------------------------
dissim_iris_d1 <- dissim(TPDs_iris_d1)
dissim_iris_d1$populations$dissimilarity

## ----echo = T, fig.width = 7, fig.height = 3-----------------------------
abundances_comm_iris <- matrix(c(c(0.9, 0.1, 0), #I. setosa dominates; virg. absent 
                          c(0.0, 0.9,  0.1 ), #I. Versic. dominates; setosa absent
                          c(0.0, 0.0,  1 )), #Only I. virg. present
                          ncol = 3, byrow = TRUE, dimnames = list(paste0("Comm.",1:3),
                          unique(iris$Species))) 
TPDc_iris <- TPDc( TPDs = TPDs_iris, sampUnit = abundances_comm_iris) 
plotTPD(TPDc_iris, nRowCol = c(1,3))
dissim_iris_comm <- dissim(TPDc_iris)
dissim_iris_comm$communities$dissimilarity

## ----echo = T, fig.width = 7, fig.height = 3-----------------------------
dissim_iris_comm$communities$P_shared
dissim_iris_comm$communities$P_non_shared

## ----echo=T--------------------------------------------------------------
TPDs_iris <- TPDs(species = sp_iris, traits_iris)
abundances_comm_iris <- matrix(c(c(0.9,  0.05, 0.05), #I. setosa dominates 
                                 c(0.0,  0.5,  0.5 ), #I. setosa absent
                                 c(0.33, 0.33, 0.33), #Equal abundances
                                 c(0.1,  0.45, 0.45), #Versicolor and virginica dominate
                                 c(0.5,  0,    0.5)), #versicolor absent
                          ncol = 3, byrow = TRUE, dimnames = list(paste0("Comm.",1:5),
                          unique(iris$Species))) 
TPDc_iris <- TPDc( TPDs = TPDs_iris, sampUnit = abundances_comm_iris) 

## ----echo=T, fig.width = 7, fig.height = 5-------------------------------
FRed_iris <- redundancy(TPDc = TPDc_iris)

plotTPD(TPD = TPDc_iris, leg.text = paste(names(FRed_iris$redundancy),
  round(FRed_iris$redundancy, 3), sep="; FRed="))

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
TPDs_iris <- TPDs(species = sp_iris, traits_iris, alpha=0.95)

abundances_comm_iris <- matrix(c(c(0.9,  0.1, 0), # setosa dominates 
                                 c(0.4,  0.5, 0.1 ), 
                                 c(0.15, 0.7, 0.15), #versicolor dominates
                                 c(0.1,  0.5, 0.4),
                                 c(0,    0.1, 0.9)), #virginica dominates
                            ncol = 3, byrow = TRUE, dimnames = list(paste0("Comm.",1:5),
                            unique(iris$Species)))
TPDc_iris <- TPDc( TPDs = TPDs_iris, sampUnit = abundances_comm_iris)

plotTPD(TPD = TPDc_iris, nRowCol = c(1,5))

dissim_iris_sp <- dissim(TPDs_iris)

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
Rao_iris <- Rao(diss = dissim_iris_sp, TPDc = TPDc_iris)

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
Rao_iris_noReg <- Rao(diss = dissim_iris_sp, TPDc = TPDc_iris, regional=F)

## ----echo=T, fig.width = 7, fig.height = 3-------------------------------
Rao_iris$pairwise$beta_prop

## ----version, eval = TRUE, echo = FALSE, results='asis'------------------
mi.tiempo <- Sys.time()
mi.tiempo

