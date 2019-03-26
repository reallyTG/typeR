library(thor)


### Name: mdb_txn
### Title: Use mdb transactions
### Aliases: mdb_txn

### ** Examples

# Start by creating a new environment, and within that a write
# transaction
env <- thor::mdb_env(tempfile())
txn <- env$begin(write = TRUE)

# With this transaction we can write values and see them as set
txn$put("a", "hello")
txn$get("a")

# But because the transaction is not committed, any new
# transaction will not see the values:
env$get("a", missing_is_error = FALSE) # NULL
txn2 <- env$begin()
txn2$get("a", missing_is_error = FALSE) # NULL

# Once we commit a transaction, *new* transactions will see the
# value
txn$commit()
env$get("a") # "hello"
env$begin()$get("a") # "hello"

# But old transactions retain their consistent view of the database
txn2$get("a", missing_is_error = FALSE)

# Cleanup
env$destroy()



