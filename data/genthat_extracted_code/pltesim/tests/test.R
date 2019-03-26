data('negative')

# Test btscs -------------------------------------------------------------------
neg_df <- btscs(negative, event = 'y', t_var = 'tim', cs_unit = 'group')

test_that('btscs output validity', {
          expect_equal(nrow(neg_df), 1000)
          expect_equal(ncol(neg_df), 7)
          expect_equal(sum(neg_df[['spell_time']]), 10327)
})
