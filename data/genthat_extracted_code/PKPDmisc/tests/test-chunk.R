context("test-chunk.R")

describe("chunking works", {
  it("chunks together by unique elements", {
    expect_equal(chunk(1:9, 3), c(1, 1, 1, 2, 2, 2, 3, 3, 3))
  })
  it("chunks ignoring non-unique elements", {
    expect_equal(chunk(c(1, 1, 1:7), 3), c(1, 1, 1, 2, 2, 2, 3, 3, 3))
  })
  it("chunks unique groups as evenly as possible", {
    # chunk group should have 1, 2 in grp 1, then 3/4, grp2, 5/6 in grp3, 1 remainder
    # so gets bumped 1/2/3 grp1, 4/5 grp2, 6/7 grp3
    # since only 
    expect_equal(chunk_grp(c(1, 1, 1:7), 3), c(1, 1, 1, 1, 1, 2, 2, 3, 3))
  })
  it("chunks unique elements into a list with their representative values", {
    expect_equal(chunk(letters[1:9], 3), c(1, 1, 1, 2, 2, 2, 3, 3, 3))
    expect_equal(chunk_list(letters[1:9], 3), 
                 list(c("a", "b", "c"), 
                      c("d", "e", "f"), 
                      c("g", "h", "i")))
  })
  it("chunks unique elements into equal list if not grp_list", {
    expect_equal(chunk_list(letters[c(1, 1, 1:7)], 3), 
                 list(c("a", "a", "a"), 
                      c("b", "c", "d"), 
                      c("e", "f", "g")))
  })
  it("chunks grouped elements into ragged arrays", {
    expect_equal(chunk_grp_list(c(letters[1], letters[1], letters[1:7]), 3),
                 list(c("a", "a", "a", "b", "c"),
                      c("d", "e"), 
                      c("f", "g"))
                 )
  })
})