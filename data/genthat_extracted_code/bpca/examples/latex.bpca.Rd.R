library(bpca)


### Name: latex.bpca
### Title: LaTeX table of the Biplot
### Aliases: latex.bpca
### Keywords: multivariate, table, latex, bpca

### ** Examples

#Example 1: The simplest possible
bp <- bpca(iris[-5],
           d=1:2)

latex.bpca(bp)

## Not run: 
##D #Example 2: with caption 
##D bp2 <- bpca(gabriel1971) 
##D 
##D latex.bpca(bp2,
##D            caption='Biplot gabriel1971')
##D 
##D # Example 3: Almost worked
##D latex.bpca(bp,
##D            caption='Biplot da base de dados iris',
##D            v.partial='Parcial',
##D            v.accumulated='Acumulada',
##D            eigenvalues='Autovalores',
##D            eigenvectors='Autovetores',
##D            v.retained='Var. retida')
##D 
##D # Example 4: Changing the column first alignment
##D bp3 <- bpca(gge2003,
##D             d=1:3)
##D 
##D latex.bpca(bp3,
##D            caption='Biplot gge2003. Changing the column first alignment',    
##D            alg1='r')
##D 
##D # Example 5: Changing the column second alignment
##D latex.bpca(bp3,
##D            caption='Biplot gge2003. Changing the column second alignment',    
##D            alg2='>{\\raggedright}p{0.1cm}')
##D 
##D 
##D # Example 6: Changing the column alignment with numbers
##D latex.bpca(bp3,
##D            caption='Biplot gge2003. Changing the column alignment with numbers',    
##D            alg1='r',
##D            alg2='r',
##D            algnumbers='>{\\raggedleft}p{2.2cm}') 
##D 
##D # Example 7: Changing the header alignment 
##D latex.bpca(bp3,
##D            caption='Biplot gge2003. Changing the header alignment',    
##D            algheader='r')
##D 
##D # Example 8: Changing the table alignment 
##D latex.bpca(bp3,
##D            caption='Biplot gge2003. Changing the table alignment',    
##D            algtable='\\flushright')
##D  
##D # Example 9: I want only two places decimal
##D latex.bpca(bp3,
##D            round=2,
##D            caption='Biplot gge2003', 
##D            algnumbers='>{\\centering}p{2.2cm}',
##D            pc.label='Principal Component-')
##D 
##D # Example 10: With bold in the header, subheader and variables
##D latex.bpca(bp3,
##D            round=2,
##D            caption='Biplot gge2003',
##D            eigenvalues='\\textbf{Eigenvalues}',
##D            eigenvectors='\\textbf{Eigenvectors}',
##D            v.retained='\\textbf{Variance retained (%)}',
##D            v.partial='\\textbf{Partial}',
##D            v.accumulated='\\textbf{Accumulated}',
##D            ft.variable='bold',
##D            ft.components='bold')  
##D 
##D # Example 11: The font of table is very large
##D latex.bpca(bp3,
##D            round=2,
##D            caption='Biplot gge2003', 
##D            pc.label='\\textbf{Principal Component-}',           
##D            size='\\tiny')                     
##D 
##D # Example 12: Italic in the variables names
##D latex.bpca(bp2,
##D            round=2,
##D            caption='Biplot gabriel1971',     
##D            pc.label='\\textbf{Principal Component-}',
##D            algnumbers='>{\\centering}p{2.5cm}',
##D            ft.variable='italic') 
##D 
##D # Example 13: With footnote???
##D latex.bpca(bp2,
##D            round=2,
##D            caption='Biplot gabriel1971',     
##D            footnote='\\scriptsize $^1$ Example with footnote')
##D 
##D # Example 14: Over a footer
##D latex.bpca(bp2,
##D            round=2,
##D            size='\\tiny',
##D            caption='Biplot gabriel1971',     
##D            footnote='\\scriptsize $^1$ Example one.\\newline 
##D            \\item $^2$ Example two.')
##D 
##D # Example 15: With others principal components
##D bp4 <- bpca(gabriel1971,
##D             d=2:4)
##D 
##D latex.bpca(bp4,
##D            round=2,
##D            caption='Biplot gabriel1971')
##D 
##D # Example 16: More than one bpca objects
##D data(marina)
##D 
##D y_2007 <- subset(marina,
##D                  year==2007)
##D 
##D y_2008 <- subset(marina,
##D                  year==2008)
##D 
##D y_2009 <- subset(marina,
##D                  year==2009)   
##D 
##D bp_2007 <- bpca(y_2007[,-c(1:2)],
##D                 d=1:3)
##D 
##D bp_2008 <- bpca(y_2008[,-c(1:2)],
##D                 d=1:2) 
##D 
##D bp_2009 <- bpca(y_2009[,-c(1:2)],
##D                 d=1:2)      
##D 
##D latex.bpca(list(bp_2007,
##D                 bp_2008),
##D            round=2,
##D            caption='Biplot Marina',
##D            size='\\scriptsize')
##D 
##D # Example 17: With two lines in the table
##D latex.bpca(list(bp_2007,
##D                 bp_2008,
##D                 bp_2009),
##D            round=4,
##D            caption='Biplot Marina', 
##D            pc.label=c('2007','2008','2009'),
##D            size='\\scriptsize',
##D            hline1='\\hline \\hline',
##D            hline2='\\hline \\hline',
##D            algnumbers='>{\\raggedleft}p{1.3cm}',
##D            footnote='Note: F - Movie; D - Doc.; DH - Doc. dir. by men; DF - Doc. dir. by women.') 
## End(Not run)           



