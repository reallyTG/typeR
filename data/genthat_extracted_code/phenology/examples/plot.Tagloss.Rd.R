library(phenology)


### Name: plot.Tagloss
### Title: Plot the daily rate of tag loss.
### Aliases: plot.Tagloss

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D t <- 1:1000
##D 
##D par <- c(D1_1=200, D2D1_1=100, D3D2_1=200, 
##D          A_1=-logit(0.02), B_1=-logit(0.05), C_1=-logit(0.07))
##D phenology:::plot.Tagloss(x=list(), t=t, fitted.parameters=par, model="1")
##D phenology:::plot.Tagloss(x=NULL, t=t, fitted.parameters=par, model="1", 
##D                          scale=1000, decoration = TRUE)
##D 
##D par <- c(D1_2=200, D2D1_2=100, D3D2_2=200, 
##D          A_2=-logit(0.05), B_2=-logit(0.03), C_2=-logit(0.03))
##D phenology:::plot.Tagloss(x=list(), t=t, fitted.parameters=par, ylim=c(0, 1), 
##D                          scale = 10, model="2")
##D 
##D par <- c(D1_L2=200, D2D1_L2=100, D3D2_L2=200, 
##D          A_L2=-logit(0.05), B_L2=-logit(0.07), C_L2=-logit(0.07))
##D phenology:::plot.Tagloss(x=list(), t=t, fitted.parameters=par, model="L2")
##D 
##D par <- c(D1_R2=200, D2D1_R2=0, D3D2_R2=700, 
##D          A_R2=-logit(0.02), B_R2=-logit(0.05), C_R2=-logit(0.07))
##D phenology:::plot.Tagloss(x=list(), t=t, fitted.parameters=par, model="R2", 
##D                          col="red", add=TRUE)
##D 
##D par <- c(D1_L1=200, D2D1_L1=2000, D3D2_L1=2000, 
##D         A_L1=-logit(0.05), B_L1=-logit(0.02), C_L1=-logit(0.1))
##D phenology:::plot.Tagloss(x=list(), t=t, fitted.parameters=par, model="L1")
##D 
##D # To plot the history of individuals
##D par <- c(D1_1=200, D2D1_1=100, D3D2_1=200, 
##D          A_1=-logit(5E-4), B_1=-logit(4E-4), C_1=-logit(5E-4), 
##D          D1_2=200, D2D1_2=100, D3D2_2=200, 
##D          A_2=-logit(6E-4), B_2=-logit(5E-4), C_2=-logit(6E-4))
##D phenology:::plot.Tagloss(x=list(), t=1:1000, fitted.parameters=par, model="Cumul", 
##D                          decoration = TRUE)
##D phenology:::plot.Tagloss(x=list(), t=1:1000, fitted.parameters=par, model="Cumul", 
##D                          decoration = TRUE, col=c("red", "green", "blue"))
##D                          
##D # To plot the history of individuals
##D par <- c(D1_R1=200, D2D1_R1=100, D3D2_R1=200, 
##D          A_R1=-logit(5E-4), B_R1=-logit(4E-4), C_R1=-logit(5E-4), 
##D          D1_R2=200, D2D1_R2=100, D3D2_R2=200, 
##D          A_R2=-logit(6E-4), B_R2=-logit(5E-4), C_R2=-logit(6E-4), 
##D          D1_L1=200, D2D1_L1=100, D3D2_L1=200, 
##D          A_L1=-logit(5E-4), B_L1=-logit(4E-4), C_L1=-logit(5E-4), 
##D          D1_L2=200, D2D1_L2=100, D3D2_L2=200, 
##D          A_L2=-logit(6E-4), B_L2=-logit(5E-4), C_L2=-logit(6E-4))
##D phenology:::plot.Tagloss(x=list(), t=1:1000, fitted.parameters=par, model="Cumul", 
##D                          decoration = TRUE)
## End(Not run)



