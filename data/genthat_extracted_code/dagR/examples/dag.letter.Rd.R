library(dagR)


### Name: dag.letter
### Title: Write a DAG node symbol.
### Aliases: dag.letter

### ** Examples

dag2a<-dag.adjust(demo.dag2(), 3);
dag.draw(dag2a, paths=FALSE);
dag.letter(dag2a,  1,  0.2, 1);
dag.letter(dag2a,  2, 0.25, 1);
dag.letter(dag2a,  3,  0.3, 1);
dag.letter(dag2a,  4, 0.35, 1);
dag.letter(dag2a, 13,  0.4, 1);



