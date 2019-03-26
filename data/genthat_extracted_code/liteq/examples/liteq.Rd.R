library(liteq)


### Name: liteq
### Title: Lightweight Portable Message Queue Using 'SQLite'
### Aliases: liteq liteq-package

### ** Examples

# We don't run this, because it write to the cache directory
## Not run: 
##D db <- tempfile()
##D q <- ensure_queue("jobs", db = db)
##D q
##D list_queues(db)
##D 
##D # Publish two messages
##D publish(q, title = "First message", message = "Hello world!")
##D publish(q, title = "Second message", message = "Hello again!")
##D list_messages(q)
##D 
##D # Consume one
##D msg <- try_consume(q)
##D msg
##D 
##D ack(msg)
##D list_messages(q)
##D msg2 <- try_consume(q)
##D nack(msg2)
##D list_messages(q)
##D 
##D # No more messages
##D try_consume(q)
## End(Not run)



