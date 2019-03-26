library(rtika)


### Name: tika_jar
### Title: Path to Apache Tika
### Aliases: tika_jar

### ** Examples

## No test: 
jar <- tika_jar()
# see help
sys::exec_wait('java',c('-jar',jar, '--help'))
# detect language of web page
sys::exec_wait('java',c('-jar',jar, '--language','https://tika.apache.org/'))
## End(No test)



