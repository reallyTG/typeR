library(testthat)
library(jdx)

# These tests cover only the rudimentary low-level interface. Comprehensive data
# testing is done in the jsr223 package for two reasons. First, the tests are 
# much easier to create with the help of JavaScript. Second, the jdx
# functionality was originally a part of jsr223 when the tests were first
# written.

context("Low-level interface")

test_that(
  "createJavaToRobject"
  , {
    j2r <- createJavaToRobject()
    expect_equivalent(class(j2r), "jobjRef")
    expect_identical(j2r@jclass, "org/fgilbert/jdx/JavaToR")
  }
)

test_that(
  "jdxConstants"
  , {
    z <- jdxConstants()
    expect_identical(class(z), "list")
    expect_gt(length(z), 1)
    expect_gt(length(names(z)), 1)
  }
)

test_that(
  "convertToRlowLevel"
  , {
    j2r <- createJavaToRobject()
    expect_identical(convertToRlowLevel(j2r), NULL)
    
    o <- rJava::.jnew("java/lang/Integer", 4L, check = FALSE)
    composite.data.code <- rJava::.jcall(j2r, "I", "initialize", rJava::.jcast(o))
    expect_identical(convertToRlowLevel(j2r), 4L)
    expect_identical(convertToRlowLevel(j2r, processCompositeDataCode(j2r, composite.data.code)), 4L)
    
    composite.data.code <- rJava::.jcall(j2r, "I", "initialize", rJava::.jcast(o), 0x12000000L)
    data.code <- processCompositeDataCode(j2r, composite.data.code)
    expect_identical(data.code[4], 0x12000000L)
    expect_error(convertToRlowLevel(j2r, data.code), "Unsupported data type \\(type:0xFE, structure:0xFF00)\\.")
    
    df1 <- data.frame(a = 1:26, b = letters, stringsAsFactors = TRUE)
    o <- convertToJava(df1)
    composite.data.code <- rJava::.jcall(j2r, "I", "initialize", rJava::.jcast(o))
    data.code <- processCompositeDataCode(j2r, composite.data.code)
    df2 <- convertToRlowLevel(j2r, data.code, strings.as.factors = TRUE)
    expect_identical(df1, df2)
    df1 <- data.frame(a = 1:26, b = letters, stringsAsFactors = FALSE)
    o <- convertToJava(df1)
    composite.data.code <- rJava::.jcall(j2r, "I", "initialize", rJava::.jcast(o))
    data.code <- processCompositeDataCode(j2r, composite.data.code)
    df2 <- convertToRlowLevel(j2r, data.code, strings.as.factors = FALSE)
    expect_identical(df1, df2)
  }
)
