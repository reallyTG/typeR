library(thor)


### Name: mdb_env
### Title: Create an mdb_env environment
### Aliases: mdb_env

### ** Examples

# Create a new environment (just using defaults)
env <- thor::mdb_env(tempfile())

# At its most simple (using temporary transactions)
env$put("a", "hello world")
env$get("a")

# Or create transactions
txn <- env$begin(write = TRUE)
txn$put("b", "another")
txn$put("c", "value")

# Transaction not committed so value not visible outside our transaction
env$get("b", missing_is_error = FALSE)

# After committing, the values are visible for new transactions
txn$commit()
env$get("b", missing_is_error = FALSE)

# A convenience method, 'with_transaction' exists to allow
# transactional workflows with less code repetition.

# This will get the old value of a key 'a', set 'a' to a new value
# and return the old value:
env$with_transaction(function(txn) {
  val <- txn$get("a")
  txn$put("a", "new_value")
  val
}, write = TRUE)

# If an error occurred, the transaction would be aborted.  So far,
# not very interesting!

# More interesting: implementing redis's RPOPLPUSH that takes the
# last value off of the end of one list and pushes it into the
# start of another.
rpoplpush <- function(env, src, dest) {
  f <- function(txn) {
    # Take the value out of the source list and update
    val <- unserialize(txn$get(src, as_raw = TRUE))
    take <- val[[length(val)]]
    txn$put(src, serialize(val[-length(val)], NULL))

    # Put the value onto the destination list
    val <- unserialize(txn$get(dest, as_raw = TRUE))
    txn$put(dest, serialize(c(val, take), NULL))

    # And we'll return the value that was modified
    take
  }
  env$with_transaction(f, write = TRUE)
}

# Set things up - a source list with numbers 1:5 and an empty
# destination list
env$put("src", serialize(1:5, NULL))
env$put("dest", serialize(integer(0), NULL))

# then try it out:
rpoplpush(env, "src", "dest") # 5
rpoplpush(env, "src", "dest") # 4
rpoplpush(env, "src", "dest") # 3

# Here is the state of the two lists
unserialize(env$get("src"))
unserialize(env$get("dest"))

# The above code will fail if one of the lists is available
env$del("dest")
try(rpoplpush(env, "src", "dest"))

# but because it's in a transaction, this failed attempt leaves src
# unchanged
unserialize(env$get("src"))



