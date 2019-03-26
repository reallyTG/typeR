library(thor)


### Name: mdb_cursor
### Title: Use mdb transactions
### Aliases: mdb_cursor

### ** Examples

# Start by creating a new environment, and within that a write
# transaction, and from that a new cursor.  But first put a bunch
# of data into the database
env <- thor::mdb_env(tempfile())
env$mput(letters, LETTERS)
txn <- env$begin(write = TRUE)
cur <- txn$cursor()

# Move the cursor to the first position
cur$first()

# The key and value:
cur$key()
cur$value()

# Move to a different key:
cur$move_to("g")
cur$value()

# Delete the current item
cur$del()
cur$key()

# We can't move to 'g' any more as it's gone:
(cur$move_to("g"))
cur$key() # NULL

# But we can *seek* 'g', which will move to 'h'
(cur$seek("g"))
cur$key() # "h"

# Get raw values out:
cur$value(as_raw = TRUE)

# Cleanup
env$destroy()



