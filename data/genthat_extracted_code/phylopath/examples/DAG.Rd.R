library(phylopath)


### Name: DAG
### Title: Directed acyclic graphs (DAGs)
### Aliases: DAG

### ** Examples

  # Use formula notation to create DAGs:
  plot(DAG(A~B, B~C))
  # Use + to easily add multiple parents to a node:
  plot(DAG(A~B+C))
  # Add a node as it's own parent to create an isolate:
  plot(DAG(A~B+C, D~D))



