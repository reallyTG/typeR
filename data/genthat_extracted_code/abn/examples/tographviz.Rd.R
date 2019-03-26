library(abn)


### Name: tographviz
### Title: Convert a dag into graphviz format
### Aliases: tographviz
### Keywords: graphviz

### ** Examples

## Not run: 
##D 
##D mydat<-ex0.dag.data[,c("b1","b2","b3","g1","b4","p2","p4")];## take a subset of cols
##D 
##D ## setup distribution list for each node
##D mydists<-list(b1="binomial",
##D               b2="binomial",
##D               b3="binomial",
##D               g1="gaussian",
##D               b4="binomial",
##D               p2="poisson",
##D               p4="poisson"
##D              );
##D ## specify DAG model 
##D mydag<-matrix(data=c(
##D                      0,1,0,0,1,0,0, # 
##D                      0,0,0,0,0,0,0, #
##D                      0,1,0,0,1,0,0, # 
##D                      1,0,0,0,0,0,1, # 
##D                      0,0,0,0,0,0,0, #
##D                      0,0,0,1,0,0,0, #
##D                      0,0,0,0,1,0,0  #
##D                      ), byrow=TRUE,ncol=7);
##D colnames(mydag)<-rownames(mydag)<-names(mydat);
##D 
##D ## create file for processing with graphviz
##D tographviz(dag.m=mydag,data.df=mydat,data.dists=mydists,outfile="graph.dot",directed=TRUE);
##D ## and then process using graphviz tools e.g. on linux
##D system("dot -Tpdf -o graph.pdf graph.dot")
##D system("evince graph.pdf");
##D 
##D ## example using data with a group variable.
##D 
##D ## model where b1<-b2
##D mydag<-matrix(data=c(
##D                      0,1, # b1
##D                      0,0  # b2
##D                      ), byrow=TRUE,ncol=2);
##D 
##D colnames(mydag)<-rownames(mydag)<-names(ex3.dag.data[,c(1,2)]);
##D ## specific distributions
##D mydists<-list(b1="binomial",
##D               b2="binomial"
##D              );
##D 
##D ## create file for processing with graphviz
##D tographviz(dag.m=mydag,data.df=ex3.dag.data[,c(1,2,14)],data.dists=mydists,
##D            group.var="group",outfile="graph.dot",directed=FALSE);
##D ## and then process using graphviz tools e.g. on linux
##D system("dot -Tpdf -o graph.pdf graph.dot")
##D system("evince graph.pdf");
## End(Not run)




