library(ledger)


### Name: prune_coa
### Title: Prune plaintext "Chart of Accounts" names to a given maximum
###   depth
### Aliases: prune_coa prune_coa_string

### ** Examples

df <- tibble::tribble(~account, ~amount,
                     "Assets:Checking:BankA", 1000,
                     "Assets:Checking:BankB", 1000,
                     "Assets:Savings:BankA", 1000,
                     "Assets:Savings:BankC", 1000)
prune_coa(df)
prune_coa(df, 2)
prune_coa(df, 3)
prune_coa(df, 4)
prune_coa(df, 2, account, account2)
prune_coa(prune_coa(df, 2, account, account2), 3, account2, account3)
prune_coa_string(df$account, 2)




