library(RStripe)


### Name: stripe_create_card
### Title: Add a credit card to Stripe.
### Aliases: stripe_create_card

### ** Examples

## Not run: 
##D stripe_create_card("sk_test_BQokikJOvBiI2HlWgH4olfQ2", "cus_4cb7HNjNSqqV2H", 
##D list(card="tok_14SsjM2eZvKYlo2CCtdx2AvO")
## End(Not run)

## Not run: 
##D stripe_create_card("sk_test_BQokikJOvBiI2HlWgH4olfQ2", "cus_4cb7HNjNSqqV2H", 
##D list(card=list(number="4242424242424242", exp_month="03", exp_year="2018")))
## End(Not run)




