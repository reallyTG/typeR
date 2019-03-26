library(brainwaver)


### Name: sim.graph
### Title: Simulation of graphs
### Aliases: sim.rand sim.equadist sim.reg
### Keywords: graphs datagen

### ** Examples



#Coordinates of the nodes of the graph

set2<-array(c(5,6.5,7,6.5,5,3.5,3,3.5,1,1.5,3,4.5,5,4.5,3,1.5),dim=c(8,2))
names<-c(1:8)


# For a random graph

mat<-sim.rand(8,20)

plot(set2[,1], set2[,2], type = "n",xlab="", ylab="",cex.lab=1.5)
text(set2[,1], set2[,2], names, cex = 1.5)

for(k in 2:8){
                for(q in 1:(k-1)){

                if(mat[k,q]==1)
                {

                visu <- "red"
                lines(c(set2[k,1], set2[q,1]), c(set2[k,2], set2[q,2]), col = visu)
        }

}
}

# For a lattice graph

mat<-sim.reg(8,20)

plot(set2[,1], set2[,2], type = "n",xlab="", ylab="",cex.lab=1.5)
text(set2[,1], set2[,2], names, cex = 1.5)

for(k in 2:8){
                for(q in 1:(k-1)){

                if(mat[k,q]==1)
                {

                visu <- "red"
                lines(c(set2[k,1], set2[q,1]), c(set2[k,2], set2[q,2]), col = visu)
        }

}
}

# For a graph with a given degree distribution

degree<-c(1,2,3,4,5,6,7,8)
mat<-sim.equadist(degree)

plot(set2[,1], set2[,2], type = "n",xlab="", ylab="",cex.lab=1.5)
text(set2[,1], set2[,2], names, cex = 1)

for(k in 2:8){
                for(q in 1:(k-1)){

                if(mat[k,q]==1)
                {

                visu <- "red"
                lines(c(set2[k,1], set2[q,1]), c(set2[k,2], set2[q,2]), col = visu)
        }

}
}

# For a scale-free graph

# Simulation of a scale-free degree distribution

x<-1:50
probx<-x^(-1.4)
n.nodes<-8
n.edges<-25
sf.degree<-rep(0,n.nodes)

stop<-0

while(stop==0){

r<-sample(x,n.nodes,prob=probx,replace=TRUE)
if(sum(r)==n.edges) stop<-1
  }

sf.degree<-r

mat<-sim.equadist(sf.degree)

plot(set2[,1], set2[,2], type = "n",xlab="", ylab="",cex.lab=1.5)
text(set2[,1], set2[,2], names, cex = 1)

for(k in 2:8){
                for(q in 1:(k-1)){

                if(mat[k,q]==1)
                {

                visu <- "red"
                lines(c(set2[k,1], set2[q,1]), c(set2[k,2], set2[q,2]), col = visu)
        }

}
}





