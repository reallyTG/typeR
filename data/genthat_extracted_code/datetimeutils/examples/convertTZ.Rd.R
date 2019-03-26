library(datetimeutils)


### Name: convert_tz
### Title: Convert a Timestamp from one Timezone to Another
### Aliases: convert_tz

### ** Examples


convert_tz("2016-05-10 12:00:00",
          "America/Chicago", "America/Chicago")

convert_tz("2016-05-10 12:00:00",
          "Europe/Berlin", "America/Chicago")

convert_tz(Sys.time(), to = "Europe/London")
convert_tz(Sys.time(), to = "America/Chicago")





