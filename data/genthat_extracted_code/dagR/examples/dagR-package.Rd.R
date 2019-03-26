library(dagR)


### Name: dagR-package
### Title: R functions for directed acyclic graphs
### Aliases: dagR-package dagR
### Keywords: package

### ** Examples

dag1<-demo.dag1();
dag.draw(dag1);
dag1a<-dag.adjust(dag1, 3);
dag.draw(dag1a);
dag1s<-dag.search(dag1);
summary_dagRdag(dag1);
summary_dagRdag(dag1a);
summary_dagRdag(dag1s);



