library(rprintf)


### Name: rprintf
### Title: Build a character vector or list with adaptive string formatting
### Aliases: rprintf

### ** Examples

## Not run: 
##D #' # Format a single-entry character vector with sprintf mechanism
##D rprintf('Hello, %s','world')
##D rprintf('%s (%d years old)','Ken',24)
##D rprintf('He is %d but has a height of %.1fcm',18,190)
##D 
##D # Format a single-entry character vector with variable mechanism
##D rprintf('Hello, $name', name='world')
##D rprintf('$name ($age years old)',name='Ken',age=24)
##D rprintf('He is $age but has a height of $height:.2fcm',age=18,height=190)
##D rprintf('$a, $b:.1f, $c:+.2f, $b, $a:.0f',a=1.56,b=2.34,c=3.78)
##D 
##D # Format a single-entry character vector with numbering mechanism
##D rprintf('Hello, {1}', 'world')
##D rprintf('{1} ({2} years old)','Ken',24)
##D rprintf('He is {1} but has a height of {2:.2f}cm',18,190)
##D rprintf('{1}, {2:.1f}, {3:+.2f}, {2}, {1:.0f}',1.56,2.34,3.78)
##D rprintf('{2},{1}','x','y')
##D 
##D # This function also works for character vectors and lists.
##D rprintf(c('%s:%d','$name:$age','{1}:{2}'),name='Ken',age=24)
##D rprintf(c(a='%s:%d',b='$name:$age',c='{1}:{2}'),name='Ken',age=24)
##D rprintf(list('%s:%d','$name:$age','{1}:{2}'),name='Ken',age=24)
##D rprintf(list(a='%s:%d',b='$name:$age',c='{1}:{2}'),name='Ken',age=24)
##D 
##D # It also works with list argument for named variables.
##D p <- list(name='Ken',age=24)
##D rprintf('name: $name, age: $age',p)
##D rprintf('name: {1}, age: {2}',p)
##D 
##D Note that when the list of arguments are given names,
##D the variable names in format string should be modified.
##D rprintf('name: $arg.name, age: $arg.age', arg = p)
## End(Not run)



