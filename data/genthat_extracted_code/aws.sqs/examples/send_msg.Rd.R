library(aws.sqs)


### Name: send_msg
### Title: send_msg
### Aliases: send_msg

### ** Examples

## Not run: 
##D   # list current queues
##D   list_queues()
##D   
##D   # create a queue
##D   queue <- create_queue("ExampleQueue")
##D   get_queue_url("ExampleQueue")
##D   
##D   # send message to queue
##D   send_msg("ExampleQueue", "This is a test message")
##D   # receive a message
##D   (m <- receive_msg("ExampleQueue", timeout = 0))
##D   
##D   # delete a message from queue
##D   delete_msg("ExampleQueue", m$ReceiptHandle[1])
##D   
##D   # delete queue
##D   delete_queue("ExampleQueue")
##D   
## End(Not run)



