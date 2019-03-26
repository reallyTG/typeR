library(dagR)


### Name: eval.paths
### Title: Evaluate potentially biasing paths in a DAG.
### Aliases: eval.paths

### ** Examples

dag1<-demo.dag1();
dag1a<-dag.adjustment(dag1, A=3); # normally called via dag.adjust();
dag1f<-find.paths(dag1a);
dag1e<-eval.paths(dag1f);
names(dag1);
names(dag1a);
names(dag1f);
names(dag1e);



