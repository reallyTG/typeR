library(anytime)


### Name: iso8601
### Title: Format a Datetime object: ISO 8601, RFC 2822 or RFC 3339
### Aliases: iso8601 rfc2822 rfc3339 yyyymmdd

### ** Examples

iso8601(anytime("2016-09-01 10:11:12.123456"))
iso8601(anydate("2016-Sep-01"))

rfc2822(anytime("2016-09-01 10:11:12.123456"))
rfc2822(anydate("2016-Sep-01"))

rfc3339(anytime("2016-09-01 10:11:12.123456"))
rfc3339(anydate("2016-Sep-01"))

yyyymmdd(anytime("2016-09-01 10:11:12.123456"))
yyyymmdd(anydate("2016-Sep-01"))



