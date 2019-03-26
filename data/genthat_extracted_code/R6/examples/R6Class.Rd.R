library(R6)


### Name: R6Class
### Title: Create an R6 reference object generator
### Aliases: R6Class R6

### ** Examples

# A queue ---------------------------------------------------------
Queue <- R6Class("Queue",
  public = list(
    initialize = function(...) {
      for (item in list(...)) {
        self$add(item)
      }
    },
    add = function(x) {
      private$queue <- c(private$queue, list(x))
      invisible(self)
    },
    remove = function() {
      if (private$length() == 0) return(NULL)
      # Can use private$queue for explicit access
      head <- private$queue[[1]]
      private$queue <- private$queue[-1]
      head
    }
  ),
  private = list(
    queue = list(),
    length = function() base::length(private$queue)
  )
)

q <- Queue$new(5, 6, "foo")

# Add and remove items
q$add("something")
q$add("another thing")
q$add(17)
q$remove()
#> [1] 5
q$remove()
#> [1] 6

# Private members can't be accessed directly
q$queue
#> NULL
# q$length()
#> Error: attempt to apply non-function

# add() returns self, so it can be chained
q$add(10)$add(11)$add(12)

# remove() returns the value removed, so it's not chainable
q$remove()
#> [1] "foo"
q$remove()
#> [1] "something"
q$remove()
#> [1] "another thing"
q$remove()
#> [1] 17


# Active bindings -------------------------------------------------
Numbers <- R6Class("Numbers",
  public = list(
    x = 100
  ),
  active = list(
    x2 = function(value) {
      if (missing(value)) return(self$x * 2)
      else self$x <- value/2
    },
    rand = function() rnorm(1)
  )
)

n <- Numbers$new()
n$x
#> [1] 100
n$x2
#> [1] 200
n$x2 <- 1000
n$x
#> [1] 500

# If the function takes no arguments, it's not possible to use it with <-:
n$rand
#> [1] 0.2648
n$rand
#> [1] 2.171
# n$rand <- 3
#> Error: unused argument (quote(3))


# Inheritance -----------------------------------------------------
# Note that this isn't very efficient - it's just for illustrating inheritance.
HistoryQueue <- R6Class("HistoryQueue",
  inherit = Queue,
  public = list(
    show = function() {
      cat("Next item is at index", private$head_idx + 1, "\n")
      for (i in seq_along(private$queue)) {
        cat(i, ": ", private$queue[[i]], "\n", sep = "")
      }
    },
    remove = function() {
      if (private$length() - private$head_idx == 0) return(NULL)
      private$head_idx <<- private$head_idx + 1
      private$queue[[private$head_idx]]
    }
  ),
  private = list(
    head_idx = 0
  )
)

hq <- HistoryQueue$new(5, 6, "foo")
hq$show()
#> Next item is at index 1
#> 1: 5
#> 2: 6
#> 3: foo
hq$remove()
#> [1] 5
hq$show()
#> Next item is at index 2
#> 1: 5
#> 2: 6
#> 3: foo
hq$remove()
#> [1] 6



# Calling superclass methods with super$ --------------------------
CountingQueue <- R6Class("CountingQueue",
  inherit = Queue,
  public = list(
    add = function(x) {
      private$total <<- private$total + 1
      super$add(x)
    },
    get_total = function() private$total
  ),
  private = list(
    total = 0
  )
)

cq <- CountingQueue$new("x", "y")
cq$get_total()
#> [1] 2
cq$add("z")
cq$remove()
#> [1] "x"
cq$remove()
#> [1] "y"
cq$get_total()
#> [1] 3


# Non-portable classes --------------------------------------------
# By default, R6 classes are portable, which means they can be inherited
# across different packages. Portable classes require using self$ and
# private$ to access members.
# When used in non-portable mode, members can be accessed without self$,
# and assignments can be made with <<-.

NP <- R6Class("NP",
  portable = FALSE,
  public = list(
    x = NA,
    getx = function() x,
    setx = function(value) x <<- value
  )
)

np <- NP$new()
np$setx(10)
np$getx()
#> [1] 10

# Setting new values ----------------------------------------------
# It is possible to add new members to the class after it has been created,
# by using the $set() method on the generator.

Simple <- R6Class("Simple",
  public = list(
    x = 1,
    getx = function() self$x
  )
)

Simple$set("public", "getx2", function() self$x*2)

# Use overwrite = TRUE to overwrite existing values
Simple$set("public", "x", 10, overwrite = TRUE)

s <- Simple$new()
s$x
s$getx2()


# Cloning objects -------------------------------------------------
a <- Queue$new(5, 6)
a$remove()
#> [1] 5

# Clone a. New object gets a's state.
b <- a$clone()

# Can add to each queue separately now.
a$add(10)
b$add(20)

a$remove()
#> [1] 6
a$remove()
#> [1] 10

b$remove()
#> [1] 6
b$remove()
#> [1] 20


# Deep clones -----------------------------------------------------

Simple <- R6Class("Simple",
 public = list(
   x = NULL,
   initialize = function(val) self$x <- val
 )
)

Cloner <- R6Class("Cloner",
  public = list(
    s = NULL,
    y = 1,
    initialize = function() self$s <- Simple$new(1)
  )
)

a <- Cloner$new()
b <- a$clone()
c <- a$clone(deep = TRUE)

# Modify a
a$s$x <- 2
a$y <- 2

# b is a shallow clone. b$s is the same as a$s because they are R6 objects.
b$s$x
#> [1] 2
# But a$y and b$y are different, because y is just a value.
b$y
#> [1] 1

# c is a deep clone, so c$s is not the same as a$s.
c$s$x
#> [1] 1
c$y
#> [1] 1


# Deep clones with custom deep_clone method -----------------------

CustomCloner <- R6Class("CustomCloner",
  public = list(
    e = NULL,
    s1 = NULL,
    s2 = NULL,
    s3 = NULL,
    initialize = function() {
      self$e <- new.env(parent = emptyenv())
      self$e$x <- 1
      self$s1 <- Simple$new(1)
      self$s2 <- Simple$new(1)
      self$s3 <- Simple$new(1)
    }
  ),
  private = list(
    # When x$clone(deep=TRUE) is called, the deep_clone gets invoked once for
    # each field, with the name and value.
    deep_clone = function(name, value) {
      if (name == "e") {
        # e1 is an environment, so use this quick way of copying
        list2env(as.list.environment(value, all.names = TRUE),
                 parent = emptyenv())

      } else if (name %in% c("s1", "s2")) {
        # s1 and s2 are R6 objects which we can clone
        value$clone()

      } else {
        # For everything else, just return it. This results in a shallow
        # copy of s3.
        value
      }
    }
  )
)

a <- CustomCloner$new()
b <- a$clone(deep = TRUE)

# Change some values in a's fields
a$e$x <- 2
a$s1$x <- 3
a$s2$x <- 4
a$s3$x <- 5

# b has copies of e, s1, and s2, but shares the same s3
b$e$x
#> [1] 1
b$s1$x
#> [1] 1
b$s2$x
#> [1] 1
b$s3$x
#> [1] 5


# Debugging -------------------------------------------------------
## Not run: 
##D # This will enable debugging the getx() method for objects of the 'Simple'
##D # class that are instantiated in the future.
##D Simple$debug("getx")
##D s <- Simple$new()
##D s$getx()
##D 
##D # Disable debugging for future instances:
##D Simple$undebug("getx")
##D s <- Simple$new()
##D s$getx()
##D 
##D # To enable and disable debugging for a method in a single instance of an
##D # R6 object (this will not affect other objects):
##D s <- Simple$new()
##D debug(s$getx)
##D s$getx()
##D undebug(s$getx)
## End(Not run)



