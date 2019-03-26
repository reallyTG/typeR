library(ApacheLogProcessor)


### Name: read.apache.access.log
### Title: read.apache.log
### Aliases: read.apache.access.log

### ** Examples

path_combined = system.file("examples", "access_log_combined.txt", package = "ApacheLogProcessor")
path_common = system.file("examples", "access_log_common.txt", package = "ApacheLogProcessor")

#Read a log file with combined format and return it in a data frame
df1 = read.apache.access.log(path_combined)

#Read a log file with common format and return it in a data frame
df2 = read.apache.access.log(path_common, format="common") 

#Read only the lines that url matches with the pattern passed
df3 = read.apache.access.log(path_combined, url_includes="infinance")

#Read only the lines that url matches with the pattern passed, but do not matche the exclude pattern
df4 = read.apache.access.log(path_combined, 
url_includes="infinance", url_excludes="infinanceclient")

#Return only the ip, url and datetime columns
df5 = read.apache.access.log(path_combined, columns=c("ip", "url", "datetime"))

#Process using 2 cores in parallel for speed up. 
df6 = read.apache.access.log(path_combined, num_cores=2)





