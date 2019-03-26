library(PHYLOGR)


### Name: read.sim.data
### Title: Read Sim Files From PDSIMUL
### Aliases: read.sim.data
### Keywords: manip file

### ** Examples

# First we need to find where the Examples directory is.
# You could enter it directly (see read.pdi.data for an example).
 path.to.example <- paste(path.package(package="PHYLOGR"),"Examples/",sep="/") 



# simple example
p49.i <- paste(path.to.example,"49lbr.pdi",sep="") 
p49.s <- paste(path.to.example,"49lbr.sim",sep="")
data.49.s <- read.sim.data(p49.s, pdi.files=p49.i)
data.49.s

# several files, added variables, change column names,
# and limit number of cases

f491s <- paste(path.to.example,"49lbr.sim",sep="")
f492s <- paste(path.to.example,"49hmt.sim",sep="")
f493s <- paste(path.to.example,"49ms.sim",sep="")

f491i <- paste(path.to.example,"49lbr.pdi",sep="")
f492i <- paste(path.to.example,"49hmt.pdi",sep="")
f493i <- paste(path.to.example,"49ms.pdi",sep="")


data.hb <-
      read.sim.data(c(f491s, f492s, f493s), pdi.files=c(f491i, f492i, f493i),
                    variable.names=c("x1","x2","x3","x4","x5","x6"),
                    other.variables=data.frame(
                                     mood=c(rep("good",15),
                                            rep("bad",15),
                                            rep("terrible",19)),
                                     color=c(rep("blue",20),
                                             rep("white",29))),
                     max.num=20)

data.hb



