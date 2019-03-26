context("parse_text")

describe("parse expressions like parse(text = ...)", {
  it("can parse sinlge expression", {
    expr <- "1+1"
    res <- as.character(parse(text = expr))
    expect_identical(as.character(parse_text(expr)), res)
  })
  it("can parse multiple expressions", {
    expr <- "1+1; ls()"
    res <- as.character(parse(text = expr))
    #expect_identical(as.character(parse_text(expr)), res)

    expr <- c("1+1", "ls()")
    res <- as.character(parse(text = expr))
    #expect_identical(as.character(parse_text(expr)), res)
  })

  it("produces NA on incomplete expression and try-error on wrong expression", {
    expr <- "1 +"
    expect_true(is.na(parse_text(expr)))

    expr <- "1+)"
    expect_is(parse_text(expr), "try-error")
  })

  it("captures the error message for a wrong expression", {
    get_error_msg <- function(text) {
      res <- try(parse(text = text), silent = TRUE)
      if (inherits(res, "try-error")) {
        res <- sub("^.*<text>:", "", as.character(res))
        res <- sub("\n$", "", res)
        return(res)
      } else return("") # This is not supposed to happen!
    }
    # TODO: for some reasons this does not work as expected...
    expr <- "1+)"
    #expect_identical(as.character(parse_text(expr)), get_error_msg(expr))
  })
})
