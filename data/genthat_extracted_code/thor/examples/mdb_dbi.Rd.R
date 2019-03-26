library(thor)


### Name: mdb_dbi
### Title: Use mdb transactions
### Aliases: mdb_dbi

### ** Examples


# As always, start with the environment.  Because we're going to
# use more than one database, we must set `maxdbs` to more than 1:
env <- thor::mdb_env(tempfile(), maxdbs = 10)

# The default environment - every database
db <- env$open_database()
# The default database will always have id 1 and no name
db$id()
db$name()

# A different database
foo <- env$open_database("foo")
foo$id()
foo$name()

# Opening a database multiple times has no effect - it returns the
# same data base every call.
identical(env$open_database("foo"), foo) # TRUE

# Then we can put some data int the new database:
txn <- env$begin(foo, write = TRUE)
txn$put("hello", "world")
txn$commit()

# Now we have values in the "foo" database, but not the default one:
env$get("hello", db = NULL, missing_is_error = FALSE) # NULL
env$get("hello", db = foo,  missing_is_error = FALSE) # "world"

# Cleanup
env$destroy()



