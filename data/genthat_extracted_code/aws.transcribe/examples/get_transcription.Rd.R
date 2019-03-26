library(aws.transcribe)


### Name: get_transcription
### Title: Get AWS Transcribe Job
### Aliases: get_transcription

### ** Examples

## Not run: 
##D # start a transcription
##D ## upload a file to S3
##D library("aws.s3")
##D put_object(file = "recording.mp3", bucket = "my-bucket", object = "recording.mp3")
##D 
##D ## start trancription
##D start_transcription("first-example", "https://my-bucket.us-east-1.amazonaws.com/recording.mp3")
##D 
##D ## wait
##D Sys.sleep(5)
##D 
##D ## retrieve transcription
##D transcript <- get_transcription("first-example")
##D transcript$Transcriptions
## End(Not run)



