library(aws.ec2metadata)


### Name: aws.ec2metadata-package
### Title: Get EC2 Instance Metadata
### Aliases: aws.ec2metadata-package aws.ec2metadata is_ec2
###   instance_document metadata is_ecs ecs_metadata
### Keywords: datasets package

### ** Examples

names(metadata)

## Not run: 
##D if (is_ec2()) {
##D   metadata$versions()
##D   metadata$items()
##D 
##D   # get instance id
##D   metadata$instance_id()
##D   # get ami id
##D   metadata$ami_id()
##D   
##D   # get IAM role (NULL if none specified)
##D   metadata$iam_info()
##D   metadata$iam_role("myrole")
##D 
##D   # get an arbitrary metadata item
##D   metadata$item("meta-data/placement/availability-zone")
##D   
##D   # get region from instance identity document
##D   instance_document()$region
##D }
##D 
##D # Can also get ECS container metadata
##D if (is_ecs()) {
##D   # Get ECS role credentials
##D   ecs_metadata()
##D }
## End(Not run)



