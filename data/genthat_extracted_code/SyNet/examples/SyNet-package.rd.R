library(SyNet)


### Name: SyNet-package
### Title: Inference and Analysis of Sympatry Networks
### Aliases: SyNet-package SyNet
### Keywords: package

### ** Examples

  data(sciobius2x2)
  # Derive a sympatry matrix from distributional table.
  # Entries equal to 1 mean co-extensive sympatry.
  infer <- gridinfer(dntable = sciobius2x2)  
  # Run NAM method on the previously inferred sympatry network                                           
  outnam <- nam(infer) 
  # Extract the sympatry network with elements optimally rearranged
  # according to the NAM sequence of splitting events. 
  sm <- outnam$mt 
  # Plot the original network
  forgraph <- seq(0, by = 2*pi/47, length = 47)
  xcoord <- cos(forgraph)
  ycoord <- sin(forgraph)
  plot(xcoord, ycoord, main = "SCIOBIUS Sympatry Network", 
       xlab = "", ylab = "", pch = 19, col = 2, cex = 1.3, axes = FALSE)
  text (xcoord*1.05, ycoord*1.05, outnam$leaves)
  for (i in 1:46) 
    for (j in (i+1):47)
      if(sm[i,j] > 0) lines (c(xcoord[i], xcoord[j]), c(ycoord[i], ycoord[j]))
  mtext("Subnetwork 0 (Original network)", side = 1, line = 2, col = 4)
  # Next, we define a control window to go from initial network to the last sub-network.
  # Here, you can visualize the intrinsic dynamic associated to the iterative removal
  # of intermediary species. 
  subnet <- 0
  onClick <- function(action) {
    if(action == 1) subnet <<- 0 
    if(action == 2) subnet <<- pmax(0, subnet - 1) 
    if(action == 3) subnet <<- pmin(outnam$nsub - 1, subnet + 1) 
    if(action == 4) subnet <<- outnam$nsub - 1
    notremoved <- outnam$LastNet >= subnet
    plot(xcoord, ycoord, main = "SCIOBIUS Sympatry Network", 
         xlab = "", ylab = "", type = "n", axes = FALSE)
    points(xcoord[notremoved], ycoord[notremoved], pch = 19, col = 2)
    text (xcoord[notremoved]*1.05, ycoord[notremoved]*1.05, outnam$leaves[notremoved])
    for (i in 1:(outnam$nsp - 1)){ 
       if(!notremoved[i]) next
       for (j in (i+1):outnam$nsp) {
          if(!notremoved[j]) next
          if(sm[i,j] > 0) lines (c(xcoord[i], xcoord[j]), c(ycoord[i], ycoord[j]))
       }
    }
    mtext(paste("Subnetwork", subnet), side = 1, line = 2, col = 4)
  }
  ## Not run: 
##D   tt <- tktoplevel()
##D   tkwm.title(tt, "Evolution of NAM ...") 
##D   but1 <- tkbutton(tt, text = "<<", command = function(...) onClick(1), padx = 20)
##D   but2 <- tkbutton(tt, text = "<", command = function(...) onClick(2), padx = 20)
##D   but3 <- tkbutton(tt, text = ">", command = function(...) onClick(3), padx = 20)
##D   but4 <- tkbutton(tt, text = ">>", command = function(...) onClick(4), padx = 20)  
##D   tkgrid(tklabel(tt, text = "*** Change Sub-Network ***", font = "Times 16", foreground = "blue"),
##D          columnspan = 4)
##D   tkgrid(but1, but2, but3, but4)
##D   #Finally, type the following command to see the cleavogram called 'outnam':
##D   cleavogram()
##D   
## End(Not run)



