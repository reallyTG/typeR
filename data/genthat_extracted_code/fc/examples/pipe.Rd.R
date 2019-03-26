library(fc)


### Name: %>%
### Title: Forward-pipe Operator Using Standard Evaluation
### Aliases: %>%

### ** Examples

# Create a new code block in case the pipe operator is already
# defined.
{
  # Make sure the example uses the correct pipe operator.
  `%>%` <- fc::`%>%`

 # Create a function that gets the 9th and 10th objects using the head
 # and tail functions.
 nine_and_ten <- fc(head, n=10) %>% fc(tail, n=2)
 nine_and_ten(iris)
}



