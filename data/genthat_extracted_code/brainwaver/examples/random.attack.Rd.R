library(brainwaver)


### Name: graph.attack
### Title: Attack of graphs
### Aliases: random.attack node.attack targeted.attack
### Keywords: graphs

### ** Examples


set2<-array(c(5,6.5,7,6.5,5,3.5,3,3.5,1,1.5,3,4.5,5,4.5,3,1.5),dim=c(8,2))
names<-c(1:8)

mat<-sim.rand(8,20)

#simulated attack on node 1
plot(set2[,1], set2[,2], type = "n",xlab="", ylab="",cex.lab=1.5)
text(set2[2:8,1], set2[2:8,2], names[2:8], cex = 1.5)
text(set2[1,1], set2[1,2], 1 , cex = 1.5,col="gray")

for(k in 2:8){
                for(q in 1:(k-1)){

                if(mat[k,q]==1)
                {
                if(q==1) visu <- "gray" else visu <- "red"
                lines(c(set2[k,1], set2[q,1]), c(set2[k,2], set2[q,2]), col = visu)
        }

}
}

ra<-random.attack(mat,8,10)
na<-node.attack(mat, 1)
ta<-targeted.attack(mat,8)





