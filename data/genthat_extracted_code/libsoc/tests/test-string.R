context('string')

# Roundtrip test of string type
blk_id <- "myBlock"

block <- so_SOBlock$new()
block$blkId <- blk_id

new_blk_id <- block$blkId

expect_identical(new_blk_id, blk_id)