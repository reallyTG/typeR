library(Simile)


### Name: execute.model
### Title: Execute a Simile model to a given time point
### Aliases: execute.model

### ** Examples

for (count in 0:1738) {
  execute.model("dummy_ih", count+1, "Euler", count, 0, FALSE)
}



