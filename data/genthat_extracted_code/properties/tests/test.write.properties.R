# Simple Run-Time Tests for the write.properties function
# 
# Author: Daan Seynaeve
###############################################################################

require(properties)

# test 0: simple test of three properties
props <- list(key1 = "value1", key2 = "value2", key3 = "value3")
propFilePath <- tempfile(tmpdir = ".")
write.properties(propFilePath, props)
expectedLines = c("key1=value1", "key2=value2", "key3=value3")
stopifnot(all.equal(readLines(propFilePath), expectedLines))
file.remove(propFilePath)

# test 2: values with spaces, underscores etc.
expectedProps <- read.properties(system.file("testFiles", "test2.properties", package = "properties"))
propFilePath <- tempfile(tmpdir = ".")
write.properties(propFilePath, expectedProps)
props <- read.properties(propFilePath)
stopifnot(all.equal(props, expectedProps))
file.remove(propFilePath)

# test 3: regression test for more than 5 properties
props <- read.properties(system.file("testFiles", "test3.properties", package = "properties"))
propFilePath <- tempfile(tmpdir = ".")
write.properties(propFilePath, props, fields = c("key2", "key7"))
expectedLines <- c("key2=value2", "key7=value7")
stopifnot(all.equal(readLines(propFilePath), expectedLines))
file.remove(propFilePath)

# test 4: empty property values
expectedProps <- read.properties(system.file("testFiles", "test4.properties", package = "properties"))
propFilePath <- tempfile(tmpdir = ".")
write.properties(propFilePath, expectedProps)
props <- read.properties(propFilePath)
stopifnot(all.equal(props, expectedProps))
file.remove(propFilePath)