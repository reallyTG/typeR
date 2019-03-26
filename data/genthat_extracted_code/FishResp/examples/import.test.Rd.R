library(FishResp)


### Name: import.test
### Title: Import Background Respiration Data
### Aliases: import.test

### ** Examples

# Import raw data for pre- and post-tests

# if the data have been already loaded to R,
# skip the first line of the code:
data(info)

pre.path = system.file("extdata/stickleback/pre_raw.txt.xz", package = "FishResp")
pre <- import.test(pre.path,
                   info.data = info,
                   logger = "AutoResp",
                   n.chamber = 4,
                   plot.temperature = TRUE,
                   plot.oxygen = TRUE)

post.path = system.file("extdata/stickleback/post_raw.txt.xz", package = "FishResp")
post <- import.test(post.path,
                    info.data = info,
                    logger = "AutoResp",
                    n.chamber = 4,
                    plot.temperature = TRUE,
                    plot.oxygen = TRUE)




