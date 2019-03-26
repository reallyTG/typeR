library(condformat)


### Name: condformat2grob
### Title: Converts the table to a grid object
### Aliases: condformat2grob

### ** Examples

library(condformat)
data.frame(Student = c("Alice", "Bob", "Charlie"),
           Evaluation = c("Great", "Well done", "Good job!")) %>%
 condformat %>%
 condformat2grob



