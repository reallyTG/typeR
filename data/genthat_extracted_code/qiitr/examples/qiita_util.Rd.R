library(qiitr)


### Name: qiita_util
### Title: Generate Payload And Tag For Qiita API
### Aliases: qiita_util qiita_util_payload qiita_util_tag

### ** Examples

qiita_util_tag(name = "R", versions = ">3.1")

qiita_util_payload(body = "foo",
                   title = "test",
                   tags = list(
                     qiita_util_tag(name = "R", versions = ">3.1"),
                     qiita_util_tag(name = "dplyr")
                   ),
                   private = TRUE)




