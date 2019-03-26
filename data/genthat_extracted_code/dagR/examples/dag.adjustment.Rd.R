library(dagR)


### Name: dag.adjustment
### Title: Adjust a DAG for one or more variables.
### Aliases: dag.adjustment

### ** Examples

dag1<-demo.dag1();
dag.draw(dag.adjust(dag1, 3));
dag.draw(dag.adjust(dag1, 2));
# problem when adjusting an adjusted DAG:
dag.draw(dag.adjust(dag.adjust(dag1, 3), c(2)));



