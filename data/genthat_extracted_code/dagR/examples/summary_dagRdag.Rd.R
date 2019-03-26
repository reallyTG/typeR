library(dagR)


### Name: summary_dagRdag
### Title: Summarize a DAG.
### Aliases: summary_dagRdag

### ** Examples

d3<-demo.dag3();
d3s<-dag.search(d3);
d3a<-dag.adjust(d3, 2);
d3as<-dag.search(d3a);
summary_dagRdag(d3);
summary_dagRdag(d3s);
summary_dagRdag(d3a);
summary_dagRdag(d3as);



