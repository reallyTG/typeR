library(assertive.base)


### Name: assertionError
### Title: Condition classes
### Aliases: assertionError assertionMessage assertionWarning

### ** Examples

tryCatch(
  assert_all_are_true(FALSE), 
  error = function(e) 
  {
    if(inherits(e, "assertionCondition"))
    {
      # Handle assertions
      message("This is an assertion condition.")
      
      # Handle assertions cause by a specific predicate
      if(e$predicate_name == "is_true")
      {
      }
    } else
    {
      # Handle other error types
    }
  }
)



