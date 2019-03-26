library(Smisc)


### Name: formatDT
### Title: Converts date or datetime strings into alternate formats
### Aliases: formatDT
### Keywords: misc

### ** Examples

# Demonstrates conversion of different datetime informats
formatDT("03/12/2004 04:31:17pm", posix = FALSE)
formatDT("12Mar2004 04:31pm", posix = FALSE)
formatDT("2004-3-12 16:31:17", posix = FALSE)
formatDT("7-5-1998 22:13")

# Specifying different types of outformats
formatDT("03/12/2004", date.outformat = "dd-mon-yyyy", posix = FALSE)
formatDT("17-Sep-1782 12:31am", date.outformat = "yyyy-mm-dd",
         time.outformat = "hh:mm", posix = FALSE)

# Processing datetime vectors
formatDT(c("03/12/2004 04:31pm","03/12/2005 04:32:18pm"), posix = FALSE)
formatDT(c("03/12/2004 04:31:17pm","03/12/2005 04:32:18pm"))
formatDT(c("03/12/2004 04:31:17pm","03/12/2005 04:32:18pm"), weekday = TRUE)

# An incorrect date (will produce an error)
try(formatDT("29-Feb-2001"))

# An incorrect time will also produce an error
try(formatDT("28-Feb-2001 00:00:00 AM"))
formatDT("28-Feb-2001 12:00:00 AM")

# Illustrate the handling of missing values
formatDT(c(NA,"","2010-10-23 3:47PM"), weekday = TRUE)



