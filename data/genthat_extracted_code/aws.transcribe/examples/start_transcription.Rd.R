library(aws.transcribe)


### Name: start_transcription
### Title: Start AWS Transcribe Job
### Aliases: start_transcription

### ** Examples

## Not run: 
##D # start a transcription
##D ## upload a file to S3
##D library("aws.s3")
##D put_object(file = "recording.mp3", bucket = "my-bucket", object = "recording.mp3")
##D 
##D ## start trancription
##D start_transcription("first-example", "https://my-bucket.us-east-1.amazonaws.com/recording.mp3")
## End(Not run)



