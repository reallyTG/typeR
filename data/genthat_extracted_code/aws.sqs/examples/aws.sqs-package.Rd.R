library(aws.sqs)


### Name: aws.sqs-package
### Title: AWS SQS Client Package
### Aliases: aws.sqs-package aws.sqs
### Keywords: package

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



