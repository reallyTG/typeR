library(parsedate)


### Name: parse_iso_8601
### Title: Parse date from an ISO 8601 format
### Aliases: parse_iso_8601

### ** Examples

# Missing fields
parse_iso_8601("2013-02-08 09")
parse_iso_8601("2013-02-08 09:30")

# Separator between date and time can be a 'T'
parse_iso_8601("2013-02-08T09")
parse_iso_8601("2013-02-08T09:30")
parse_iso_8601("2013-02-08T09:30:26")

# Fractional seconds, minutes, hours
parse_iso_8601("2013-02-08T09:30:26.123")
parse_iso_8601("2013-02-08T09:30.5")
parse_iso_8601("2013-02-08T09,25")

# Zulu time zone is UTC
parse_iso_8601("2013-02-08T09:30:26Z")

# ISO weeks, not very intuitive
parse_iso_8601("2013-W06-5")
parse_iso_8601("2013-W01-1")
parse_iso_8601("2009-W01-1")
parse_iso_8601("2009-W53-7")

# Day of the year
parse_iso_8601("2013-039")
parse_iso_8601("2013-039 09:30:26Z")



